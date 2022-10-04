# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email_address, null: false
      t.string :jti, null: false
      t.string :password, null: false
      t.string :name, null: false
      t.string :phone_number, null: false

      t.timestamps
    end

    add_index :users, :email_address, unique: true
    add_index :users, :phone_number, unique: true
    add_index :users, :jti, unique: true
  end
end
