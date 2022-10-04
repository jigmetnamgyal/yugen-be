# frozen_string_literal: true

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
      profile: %i[
        cid_or_passport
        attachments: %i[
        category
        file_size
        file_type
        file
        ]
      ]
    )
  end

  def generate_token
    GenerateJwtToken.encode({ wallet_address: registration_params['wallet_address'] })
  end
end
