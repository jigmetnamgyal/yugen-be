# frozen_string_literal: true

class UserProfileUpdater < ApplicationService
  def call
    # TODO: Refactor this code. Too lazy to do now.
    profile_attributes = params.delete(:profile_attributes)

    current_user.tap do |user|
      user.update!(params)
      user.profile.update!(profile_attributes)
    end
  end
end
