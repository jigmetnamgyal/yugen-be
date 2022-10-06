# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_kyc_status, mutation: Mutations::UpdateKycStatus
    field :update_user_profile, mutation: Mutations::UpdateUserProfile
  end
end
