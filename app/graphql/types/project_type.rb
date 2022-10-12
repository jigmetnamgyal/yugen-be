# frozen_string_literal: true

module Types
  class ProjectType < BaseObject
    field :id, ID, null: false
    field :project_title, String, null: false
    field :project_description, String, null: false
    field :website_url, String, null: true
    field :social_media_url, String, null: true
    field :goal_amount, Float, null: true
    field :user, Types::UserType, null: false
    field :project_banner_url, String, null: true
    field :total_contributor, Integer, null: false
    field :funding_info, Types::FundingInfoType, null: true
    field :start_date, GraphQL::Types::ISO8601Date, null: true
    field :end_date, GraphQL::Types::ISO8601Date, null: true
    field :project_match_amount, Float, null: true, description: 'QF amount for grant project only'

    def project_banner_url
      return if object.project_banner.blob.nil?

      rails_blob_url(object.project_banner.blob, only_path: true)
    end

    def project_match_amount
      return unless object.grant_id

      total_voting_power = grant.total_voting_power
      life_time_amount_received = grant.lifetime_funding_received
      project_voting_power = object.voting_power

      (project_voting_power / total_voting_power) * life_time_amount_received
    end

    def grant
      @_grant ||= object.grant
    end
  end
end
