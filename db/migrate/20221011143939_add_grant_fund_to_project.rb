# frozen_string_literal: true

class AddGrantFundToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :goal_amount, :float
    add_column :orders, :payment_completed, :boolean, default: false
  end
end
