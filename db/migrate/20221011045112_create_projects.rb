# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.float :lifetime_funding_received
      t.string :project_title, null: false
      t.string :project_description, null: false
      t.string :website_url, null: false
      t.string :social_media_url, null: false
      t.references :projects

      t.timestamps
    end
  end
end
