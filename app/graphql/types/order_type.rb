# frozen_string_literal: true

module Types
  class OrderType < BaseObject
    field :id, ID, null: false
    field :matching_pool_contribution, Float, null: false
    field :payment_type, Types::PaymentTypeEnum, null: false
    field :project, Types::ProjectType, null: false
  end
end
