# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  belongs_to :grant, optional: true

  validates :project_title, :project_description, presence: true
end
