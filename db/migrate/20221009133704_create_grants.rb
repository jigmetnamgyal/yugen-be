# frozen_string_literal: true

class CreateGrants < ActiveRecord::Migration[7.0]
  def change
    create_table :grants do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :website_url
      t.string :social_media_url
      t.integer :grant_review_status, default: 0
      t.float :funding_received

      t.timestamps
    end
  end
end
