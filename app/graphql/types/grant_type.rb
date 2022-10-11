# frozen_string_literal: true

module Types
  class GrantType < BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :description, String, null: false
    field :website_url, String, null: true
    field :social_media_url, String, null: true
    field :grant_review_status, Types::GrantReviewStatusEnum, null: false
    field :lifetime_funding_received, Float, null: true
    field :user, Types::UserType, null: false
    field :grant_banner_url, String, null: true
    field :projects, [Types::ProjectType], null: true

    def grant_banner_url
      return if object.grant_banner.blob.nil?

      rails_blob_url(object.grant_banner.blob, only_path: true)
    end
  end
end
