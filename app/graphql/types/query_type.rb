# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field(
      :users,
      resolver: Resolvers::UsersResolver,
      connection: true
    )

    field :user, resolver: Resolvers::UserResolver

    field :grants, resolver: Resolvers::GrantsResolver
    field :grant, resolver: Resolvers::GrantResolver

    field :projects, resolver: Resolvers::ProjectsResolver
    field :project, resolver: Resolvers::ProjectResolver
  end
end
