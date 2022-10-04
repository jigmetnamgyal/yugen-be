# frozen_string_literal: true

module Graphql
  module Authenticator
    class UnauthorizedError < GraphQL::Error
      def message
        {
          errors: "#{super} field requires authentication",
          extensions: { code: 'API_ACCESS_ERROR' }
        }
      end
    end

    DEFAULT_NOT_AUTHENTICATED = ->(field) { raise UnauthorizedError, field.to_s }

    def self.use(schema)
      schema.tracer(self)
    end

    def self.trace(event, trace_data)
      # Authenticate only root level queries
      return yield unless event == 'execute_field' && trace_data[:path].size == 1

      field = trace_data[:field]

      if field.authenticate[0] && trace_data[:query].context[:current_user].nil?
        DEFAULT_NOT_AUTHENTICATED.call(field.name)
      end

      yield
    end
  end
end
