# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.float :matching_pool_contribution, null: false, default: 0
      t.integer :payment_type, null: false, default: 0
      t.references :user, null: false, foreign_key: true
      t.belongs_to :project, index: true

      t.timestamps
    end
  end
end
