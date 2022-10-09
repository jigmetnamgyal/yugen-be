# frozen_string_literal: true

class WalletAddressToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :wallet_address, :string
  endgi
end
