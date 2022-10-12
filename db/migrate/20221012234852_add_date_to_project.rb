# frozen_string_literal: true

class AddDateToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :start_date, :date, null: true
    add_column :projects, :end_date, :date, null: true
  end
end
