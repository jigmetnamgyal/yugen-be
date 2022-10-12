# frozen_string_literal: true

module Resolvers
  class OrdersResolver < PaginationBase
    graphql_name 'orders'

    scope { Order.where(payment_completed: false) }

    type Types::OrderType.connection_type, null: false
  end
end
