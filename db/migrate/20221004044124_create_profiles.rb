# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :cid_or_passport, null: false
      t.integer :kyc_status, null: false, default: 0

      t.timestamps
    end
  end
end
