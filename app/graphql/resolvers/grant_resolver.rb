# frozen_string_literal: true

module Resolvers
  class GrantResolver < BaseResolver
    argument :id, Integer, required: false, description: 'if id is not sent it fetch the current user details'
    type Types::GrantType, null: true

    def resolve(id:)
      ::Grant.find(id)
    end
  end
end
