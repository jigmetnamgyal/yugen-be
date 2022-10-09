# frozen_string_literal: true

module Api
  module V1
    class RegistrationController < ApplicationController
      def create
        render json: User.create!(registration_params.merge!(jti: generate_token))
      end

      def registration_params
        params.require(:user).permit(
          :email_address,
          :password,
          :name,
          :phone_number,
          profile_attributes: %i[
            document_number
            document_type
            documents
          ]
        )
      end

      def generate_token
        GenerateJwtToken.encode({ email_address: registration_params['email_address'] })
      end
    end
  end
end
