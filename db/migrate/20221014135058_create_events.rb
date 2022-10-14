# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: ''
      t.integer :status, null: false, default: 0
      t.datetime :start_date, null: false, default: ''
      t.datetime :end_date, null: false, default: ''

      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
