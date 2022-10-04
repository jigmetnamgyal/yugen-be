# frozen_string_literal: true

module Resolvers
  class PaginationBase < SearchObjectBase
    option(:skip, type: Int) { |scope, value| scope.offset(value) }
  end
end
