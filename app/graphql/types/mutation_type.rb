# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :update_kyc_status, mutation: Mutations::UpdateKycStatus
    field :update_user_profile, mutation: Mutations::UpdateUserProfile

    # grant
    field :create_grant, mutation: Mutations::CreateGrant
    field :add_project, mutation: Mutations::AddProject

    # order
    field :add_to_cart, mutation: Mutations::AddToCart
    field :destroy_cart, mutation: Mutations::DestroyCart
  end
end
