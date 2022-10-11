# frozen_string_literal: true

module Resolvers
  class GrantResolver < BaseResolver
    argument :id, Integer, required: false
    type Types::GrantType, null: true

    def resolve(id:)
      ::Grant.find(id)
    end
  end
end
