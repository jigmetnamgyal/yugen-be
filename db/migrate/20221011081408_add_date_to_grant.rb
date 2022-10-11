# frozen_string_literal: true

class AddDateToGrant < ActiveRecord::Migration[7.0]
  def change
    add_column :grants, :start_date, :date
    add_column :grants, :end_date, :date, null: true
  end
end
