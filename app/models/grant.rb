# frozen_string_literal: true

class Grant < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_one_attached :grant_banner

  belongs_to :user
  belongs_to :order, optional: true

  validates :description, :title, presence: true

  enum grant_review_status: { inactive: 0, approved: 1, rejected: 2 }
end
