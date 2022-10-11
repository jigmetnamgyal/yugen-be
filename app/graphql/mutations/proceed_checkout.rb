# frozen_string_literal: true

module Mutations
  class ProceedCheckout < BaseMutation
    field :status, Boolean, null: false

    def resolve
      # Integrate payment system here. For now just change the flag
      current_user.orders.each { |order| order.update!(payment_completed: true) }
      { status: true }
    end
  end
end
