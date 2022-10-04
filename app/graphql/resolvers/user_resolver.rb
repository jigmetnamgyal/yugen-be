# frozen_string_literal: true

module Resolvers
  class UserResolver < BaseResolver
    argument :id, Integer, required: false, description: 'if id is not sent it fetch the current user details'
    type Types::UserType, null: true

    def resolve(id: nil)
      return current_user unless id

      ::User.find(id)
    end
  end
end
