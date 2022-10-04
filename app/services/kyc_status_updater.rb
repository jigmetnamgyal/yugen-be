# frozen_string_literal: true

class KycStatusUpdater < ApplicationService
  def call
    User.find(params[:user_id]).tap do |user|
      user.profile.update!(kyc_status: params[:kyc_status])
    end
  end
end
