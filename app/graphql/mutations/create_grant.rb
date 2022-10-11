# frozen_string_literal: true

module Mutations
  class CreateGrant < BaseMutation
    class CreateGrantAttributes < Types::BaseInputObject
      argument :title, String, required: true
      argument :description, String, required: true
      argument :website_url, String, required: false
      argument :social_media_url, String, required: false
      argument :lifetime_funding_received, Float, required: false
      argument :grant_review_status, Types::GrantReviewStatusEnum, required: false
    end

    argument :attributes, CreateGrantAttributes, required: true
    field :user, Types::GrantType, null: true

    def resolve(attributes:)
      { user: KycStatusUpdater.call({ params: attributes.to_h, current_user: current_user }) }
    end
  end
end
