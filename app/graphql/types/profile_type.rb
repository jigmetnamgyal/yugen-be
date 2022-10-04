# frozen_string_literal: true

module Types
  class ProfileType < BaseObject
    field :id, ID, null: false
    field :email_address, String, null: false
    field :cid_or_passport, String, null: false
    field :kyc_status, Types::KycStatusEnum, null: false
  end
end
