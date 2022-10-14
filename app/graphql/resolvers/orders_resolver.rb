# frozen_string_literal: true

module Resolvers
  class OrdersResolver < PaginationBase
    graphql_name 'orders'

    scope { current_user.orders.where(payment_completed: false) }

    type Types::OrderType.connection_type, null: false

    option :project_type, type: Types::ProjectTypeEnum, with: :filter_orders

    def filter_orders(scope, value)
      if value == 'idea'
        scope.joins(:project).where(project: { grant_id: nil })
      else
        scope.joins(:project).where.not(project: { grant_id: nil })
      end
    end
  end
end
