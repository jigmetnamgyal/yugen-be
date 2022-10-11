# frozen_string_literal: true

class GrantCreator < ApplicationService
  def call
    binding.pry
    User.find(params[:user_id]).tap do |user|
      user.profile.update!(kyc_status: params[:kyc_status])
    end
  end
end
