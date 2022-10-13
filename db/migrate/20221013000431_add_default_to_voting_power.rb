# frozen_string_literal: true

class AddDefaultToVotingPower < ActiveRecord::Migration[7.0]
  def change
    change_column_default :grants, :total_voting_power, 0.0
    change_column_default :projects, :voting_power, 0.0
  end
end
