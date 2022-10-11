# frozen_string_literal: true

class Order < ApplicationRecord
  belongs_to :grant
  belongs_to :user
end
