# frozen_string_literal: true

class Attachment < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  belongs_to :attachable, polymorphic: true, optional: true

  has_one_attached :file

  validates :category, presence: true
  validates :file_type, presence: true
  validates :file_size, presence: true, numericality: true
  validates :file,
            attached: true,
            file_size: { less_than: 40.megabytes },
            file_content_type: {
              allow: %w[text/csv image/jpeg image/jpg image/png application/vnd.ms-excel]
            }

  enum category: { avatar: 0, cid_or_passport: 1 }

  def url
    rails_blob_url(file.blob)
  end
end
