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
    field :update_order, mutation: Mutations::UpdateOrder
    field :destroy_cart, mutation: Mutations::DestroyCart

    # Checkout
    field :proceed_checkout, mutation: Mutations::ProceedCheckout

    # Comments
    field :comment_on_grant, mutation: Mutations::CommentOnGrant
    field :comment_on_project, mutation: Mutations::CommentOnProject

    # events
    field :create_event, mutation: Mutations::CreateEvent
    field :update_event, mutation: Mutations::UpdateEvent
    field :rtc_token, mutation: Mutations::RtcToken
  end
end
