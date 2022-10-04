# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[7.0]
  def change
    create_table :attachments do |t|
      t.references :attachable, polymorphic: true
      t.references :user, foreign_key: true
      t.integer :category
      t.integer :file_size
      t.string :file_type

      t.timestamps
    end
  end
end
