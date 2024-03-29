# frozen_string_literal: true

module Resolvers
  class GrantsResolver < PaginationBase
    graphql_name 'grants'

    scope { Grant.all }

    type Types::GrantType.connection_type, null: false

    option :grant_review_status, type: Types::GrantReviewStatusEnum, with: :apply_enum

    option :query, type: String, with: :apply_search, description: <<~DESC
      Supports searches on grants name
    DESC

    def apply_search(scope, value)
      scope.where("CONCAT_WS(' ', title) iLIKE ?", "%#{value.squish}%")
    end

    def apply_enum(scope, value)
      scope.where(grant_review_status: value)
    end
  end
end
