# frozen_string_literal: true

module Mutations
  class UpdateUserProfile < BaseMutation
    class ProfileAttributes < Types::BaseInputObject
      argument :avatar, Types::CustomTypes::FileType, required: false
    end

    class UpdateUserProfileAttributes < Types::BaseInputObject
      argument :email_address, String, required: false
      argument :phone_number, String, required: false
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
