# frozen_string_literal: true

class CartCreator < ApplicationService
  def call
    Order.create!(params.merge!(user_id: current_user.id))
  end
end
