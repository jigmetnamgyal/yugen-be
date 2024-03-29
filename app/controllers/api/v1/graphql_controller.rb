# frozen_string_literal: true

module Api
  module V1
    class GraphqlController < ApplicationController
      # If accessing from outside this domain, nullify the session
      # This allows for outside API access while preventing CSRF attacks,
      # but you'll have to authenticate your user separately
      # protect_from_forgery with: :null_session

      def execute
        variables = prepare_variables(params[:variables])
        query = params[:query]
        operation_name = params[:operationName]
        context = { current_user: current_user }
        result = YugenBeSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
        render json: result
      rescue StandardError => e
        raise e unless Rails.env.development?

        handle_error_in_development(e)
      end

      private

      def current_user
        header = request.headers['Authorization']
        begin
          @decoded = GenerateJwtToken.decode(header)
          user = User.find_by(email_address: @decoded[:email_address])

          return user if user.jti == header

          raise GraphQL::ExecutionError, 'Not Authorized'
        rescue ActiveRecord::RecordNotFound => e
          raise GraphQL::ExecutionError, 'Not Authorized'
        rescue JWT::DecodeError => e
          raise GraphQL::ExecutionError, 'Not Authorized'
        end
      end

      # Handle variables in form data, JSON body, or a blank value
      def prepare_variables(variables_param)
        case variables_param
        when String
          if variables_param.present?
            JSON.parse(variables_param) || {}
          else
            {}
          end
        when Hash
          variables_param
        when ActionController::Parameters
          variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
        when nil
          {}
        else
          raise ArgumentError, "Unexpected parameter: #{variables_param}"
        end
      end

      def handle_error_in_development(e)
        logger.error e.message
        logger.error e.backtrace.join("\n")

        render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} },
               status: :internal_server_error
      end
    end
  end
end
