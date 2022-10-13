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
    field :project_count, Integer, null: true
    field :start_date, GraphQL::Types::ISO8601Date, null: true
    field :end_date, GraphQL::Types::ISO8601Date, null: true
    field :comments, [Types::CommentType], null: true

    def grant_banner_url
      return if object.grant_banner.blob.nil?

      rails_blob_url(object.grant_banner.blob, only_path: true)
    end

    def project_count
      object.projects&.count
    end
  end
end
