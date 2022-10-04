# frozen_string_literal: true

class Attachment < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :attachable, polymorphic: true, optional: true

  has_one_attached :file, dependent: :destroy

  validates :category, presence: true
  validates :file_type, presence: true
  validates :file_size, presence: true, numericality: true
  validates :file, attached: true

  enum category: { avatar: 0, cid_or_passport: 1 }

  def url
    rails_blob_url(file.blob)
  end
end
