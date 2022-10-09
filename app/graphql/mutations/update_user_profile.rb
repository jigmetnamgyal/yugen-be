# frozen_string_literal: true

module Mutations
  class UpdateUserProfile < BaseMutation
    class ProfileAttributes < GraphQL::Schema::InputObject
      argument :avatar, Types::CustomTypes::FileType, required: false
    end

    class UpdateUserProfileAttributes < Types::BaseInputObject
      argument :phone_number, String, required: false
      argument :name, String, required: false
      argument :wallet_address, String, required: false
      argument(
        :profile,
        ProfileAttributes,
        as: :profile_attributes,
        required: false
      )
    end

    argument :attributes, UpdateUserProfileAttributes, required: true
    field :user, Types::UserType, null: true

    def resolve(attributes:)
      { user: UserProfileUpdater.call({ params: attributes.to_h, current_user: current_user }) }
    end
  end
end
