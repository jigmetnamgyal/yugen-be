# frozen_string_literal: true

class Profile < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  belongs_to :user

  has_one_attached :avatar
  has_many_attached :documents

  enum kyc_status: { in_progress: 0, approved: 1, rejected: 2 }
end
