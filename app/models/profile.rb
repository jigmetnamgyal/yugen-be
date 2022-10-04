# frozen_string_literal: true

class Profile < ApplicationRecord
  has_one :profile, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
end
