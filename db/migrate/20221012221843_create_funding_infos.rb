# frozen_string_literal: true

class CreateFundingInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :funding_infos do |t|
      t.float :funding_in_eth
      t.float :funding_in_nu
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
