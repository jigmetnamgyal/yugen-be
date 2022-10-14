# frozen_string_literal: true

class Grant < ApplicationRecord
  has_one :event, dependent: :destroy
  has_one_attached :grant_banner

  has_many :projects, dependent: :destroy
  has_many :comments, as: :commentable

  belongs_to :user

  validates :description, :title, presence: true

  enum grant_review_status: { inactive: 0, approved: 1, rejected: 2 }
end
