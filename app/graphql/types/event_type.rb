# frozen_string_literal: true

module Types
  class EventType < BaseObject
    field :id, ID, null: false
    field :title, String, null: true
    field :status, Types::EventStatusEnum, null: true
    field :start_date, GraphQL::Types::ISO8601DateTime, null: true
    field :end_date, GraphQL::Types::ISO8601DateTime, null: true
    field :grant, Types::GrantType, null: true
    field :user, Types::UserType, null: true
  end
end
