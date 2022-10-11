# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :grants, dependent: :destroy
  belongs_to :user
end
