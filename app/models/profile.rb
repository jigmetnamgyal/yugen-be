# frozen_string_literal: true

class Profile < ApplicationRecord
  belongs_to :user
  has_many :attachments, as: :attachable, dependent: :destroy
end
