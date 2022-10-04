# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  belongs_to :user
end
