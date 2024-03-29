# frozen_string_literal: true

class Project < ApplicationRecord
  # cool
  has_many :comments, as: :commentable, dependent: :destroy

  has_one :order, dependent: :destroy
  has_one :funding_info, dependent: :destroy
  has_one_attached :project_banner

  belongs_to :user

  belongs_to :grant, optional: true

  validates :project_title, :project_description, presence: true
end
