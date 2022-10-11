# frozen_string_literal: true

module Types
  class ProjectType < BaseObject
    field :id, ID, null: false
    field :project_title, String, null: false
    field :project_description, String, null: false
    field :website_url, String, null: true
    field :social_media_url, String, null: true
    field :funding_received, Float, null: true
    field :user, Types::UserType, null: false
    field :project_banner_url, String, null: true
    field :total_contributor, Integer, null: false

    def project_banner_url
      return if object.project_banner.blob.nil?

      rails_blob_url(object.project_banner.blob, only_path: true)
    end
  end
end
