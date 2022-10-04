# frozen_string_literal: true

module Mutations
  class UpdateKycStatus < BaseMutation
    class SendForKycAttributes < Types::BaseInputObject
      argument :user_id, Integer, required: true
      argument :kyc_status, KycStatusEnum, required: true
    end

    argument :attributes, SendForKycAttributes, required: true
    field :profile, Types::UserType, null: true

    def resolve(attributes:)
      current_user.create_profile(attributes)
    end
  end
end
