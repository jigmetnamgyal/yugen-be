# frozen_string_literal: true

module Mutations
  class DestroyCart < BaseMutation
    class DestroyCartAttributes < Types::BaseInputObject
      argument :id, Integer, required: true, description: 'Order ID'
    end

    argument :attributes, DestroyCartAttributes, required: true
    type Types::OrderType

    def resolve(attributes:)
      Order.find(attributes.to_h[:id]).destroy!
    end
  end
end
