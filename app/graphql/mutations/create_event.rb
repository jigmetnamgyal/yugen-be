# frozen_string_literal: true

module Mutations
  class CreateEvent < BaseMutation
    class CreateEventAttributes < Types::BaseInputObject
      argument :grant_id, Integer, required: true
      argument :title, String, required: true
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: true
      argument :end_date, GraphQL::Types::ISO8601DateTime, required: true
    end

    argument :attributes, CreateEventAttributes, required: true
    type Types::CommentType

    def resolve(attributes:)
      ProjectCommentAdder.call({ params: attributes.to_h, current_user: current_user })
    end
  end
end
