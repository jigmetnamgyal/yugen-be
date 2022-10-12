# frozen_string_literal: true

module Mutations
  class AddProject < BaseMutation
    class AddProjectAttributes < Types::BaseInputObject
      argument :project_title, String, required: true
      argument :project_description, String, required: true
      argument :website_url, String, required: false
      argument :social_media_url, String, required: false
      argument :grant_id, Integer, required: false, description: 'Not required for Ideas'
      argument :project_banner, Types::CustomTypes::FileType, required: false
      argument :goal_amount, Float, required: false, description: 'Not Required for Grant projects'
      argument :start_date, GraphQL::Types::ISO8601Date, required: false
      argument :end_date, GraphQL::Types::ISO8601Date, required: false
    end

    argument :attributes, AddProjectAttributes, required: true
    type Types::ProjectType

    def resolve(attributes:)
      ProjectCreator.call({ params: attributes.to_h, current_user: current_user })
    end
  end
end
