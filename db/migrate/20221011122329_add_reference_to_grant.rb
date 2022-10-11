# frozen_string_literal: true

class AddReferenceToGrant < ActiveRecord::Migration[7.0]
  def change
    add_reference :grants, :order
  end
end
