# frozen_string_literal: true

module Mutations
  class UpdateEvent < BaseMutation
    class UpdateEventAttributes < Types::BaseInputObject
      argument :id, Integer, required: true
      argument :status, Types::EventStatusEnum, required: false
      argument :title, String, required: false
      argument :start_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :end_date, GraphQL::Types::ISO8601DateTime, required: false
    end

    argument :attributes, UpdateEventAttributes, required: true
    type Types::EventType

    def resolve(attributes:)
      EventUpdater.call({ params: attributes.to_h, current_user: current_user })
    end
  end
end
