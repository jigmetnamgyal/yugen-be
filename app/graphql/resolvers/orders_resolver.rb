# frozen_string_literal: true

module Resolvers
  class OrdersResolver < PaginationBase
    graphql_name 'orders'

    scope { Order.where(payment_completed: false) }

    type Types::OrderType.connection_type, null: false

    option :payment_type, type: Types::PaymentTypeEnum, with: :filter_orders

    def filter_orders(scope, value)
      scope.where(payment_type: value)
    end
  end
end
