# frozen_string_literal: true

class Grant < ApplicationRecord
  validates :description, :title, presence: true

  enum grant_review_status: { inactive: 0, approved: 1, rejected: 2 }
end
