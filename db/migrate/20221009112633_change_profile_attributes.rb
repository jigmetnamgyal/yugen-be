# frozen_string_literal: true

class ChangeProfileAttributes < ActiveRecord::Migration[7.0]
  def change
    rename_column :profiles, :cid_or_passport, :document_number
    add_column :profiles, :document_type, :integer
  end
end
