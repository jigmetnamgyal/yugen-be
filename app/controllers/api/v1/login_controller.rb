# frozen_string_literal: true

module Api
  module V1
    class LoginController < ApplicationController
      def login
        @user = User.find_by(email_address: login_params['email_address'])

        if @user.present? && valid_credentials?
          token = GenerateJwtToken.encode(email_address: login_params['email_address'])
          @user.update!(jti: token)
          render json: { jwt_token: token, user: @user, kyc_status: @user&.profile&.kyc_status }
        else
          render json: { error: 'Not Authorized' }, status: :unauthorized
        end
      end

      def login_params
        params.require(:user).permit(:email_address, :password)
      end

      def valid_credentials?
        login_params['password'] == @user.password
      end
    end
  end
end
