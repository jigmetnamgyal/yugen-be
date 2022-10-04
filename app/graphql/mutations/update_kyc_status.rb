# frozen_string_literal: true

module Mutations
  class UpdateKycStatus < BaseMutation
    class UpdateKycStatusAttributes < Types::BaseInputObject
      argument :user_id, Integer, required: true
      argument :kyc_status, Types::KycStatusEnum, required: true
    end

    argument :attributes, UpdateKycStatusAttributes, required: true
    field :user, Types::UserType, null: true

    def resolve(attributes:)
      { user: KycStatusUpdater.call({ params: attributes.to_h, current_user: current_user }) }
    end
  end
end
