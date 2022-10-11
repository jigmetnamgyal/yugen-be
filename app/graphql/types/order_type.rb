# frozen_string_literal: true

module Types
  class OrderType < BaseObject
    field :id, ID, null: false
    field :grants, [Types::GrantType], null: false
  end
end
