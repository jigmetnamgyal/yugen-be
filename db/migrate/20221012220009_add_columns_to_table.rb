# frozen_string_literal: true

class AddColumnsToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :grants, :total_voting_power, :float
    add_column :projects, :voting_power, :float
    add_column :projects, :grant_contribution, :float
  end
end
