# frozen_string_literal: true

module Resolvers
  class ProjectsResolver < PaginationBase
    graphql_name 'projects'

    scope { Project.all }

    type Types::GrantType.connection_type, null: false

    option :query, type: String, with: :apply_search, description: <<~DESC
      Supports searches on project title
    DESC

    def apply_search(scope, value)
      scope.where("CONCAT_WS(' ', project_title) iLIKE ?", "%#{value.squish}%")
    end
  end
end
