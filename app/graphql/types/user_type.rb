# frozen_string_literal: true

module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :email_address, String, null: false
    field :name, String, null: false
    field :phone_number, String, null: false
    field :profile, Types::ProfileType, null: false
  end
end
