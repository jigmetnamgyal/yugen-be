# frozen_string_literal: true

module Mutations
  class UpdateOrder < BaseMutation
    class UpdateOrderAttributes < Types::BaseInputObject
      argument :id, Integer, required: true, description: 'Order Description'
      argument :matching_pool_contribution, Float, required: true
      argument :payment_type, Types::PaymentTypeEnum, required: true
    end

    argument :attributes, UpdateOrderAttributes, required: true
    type Types::OrderType

    def resolve(attributes:)
      Order.find(attributes.to_h[:id]).tap do |order|
        order.update!(attributes.to_h)
      end
    end
  end
end
