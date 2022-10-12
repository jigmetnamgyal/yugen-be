# frozen_string_literal: true

module Mutations
  class ProceedCheckout < BaseMutation
    field :status, Boolean, null: false

    def resolve
      # Integrate payment system here. For now just change the flag
      current_user.orders.each { |order| order.update!(payment_completed: true) }
      # TODO: calculate: Funding received, grant contribution, Voting power, Total Voting power of grant

      group_orders_with_project_id.each_pair do |key, value|
        binding.pry
      end

      { status: true }
    end

    # Group Orders with project Id.
    def group_orders_with_project_id
      Order.where(payment_completed: true).group_by(&:project_id)
    end
  end
end
