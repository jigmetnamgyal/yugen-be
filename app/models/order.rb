# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :project
  belongs_to :user

  enum payment_type: { nu: 0, eth: 1, btc: 2 }
end
