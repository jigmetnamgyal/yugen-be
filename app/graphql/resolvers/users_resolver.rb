# frozen_string_literal: true

module Resolvers
  class UsersResolver < PaginationBase
    graphql_name 'users'

    scope { User.all }

    type Types::UserType.connection_type, null: false
  end
end
