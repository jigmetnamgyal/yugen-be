# frozen_string_literal: true

require 'search_object/plugin/graphql'

module Resolvers
  class PaginationBase < SearchObjectBase
    option(:skip, type: Int) { |scope, value| scope.offset(value) }
  end
end
