# frozen_string_literal: true

module Mutations
  class AddToCart < BaseMutation
    class AddToCartAttributes < Types::BaseInputObject
      argument :grant_id, Integer, required: true
    end

    argument :attributes, AddToCartAttributes, required: true
    type Types::GrantType

    def resolve(attributes:)
      CartCreator.call({ params: attributes.to_h, current_user: current_user })
    end
  end
end
