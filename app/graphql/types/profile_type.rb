# frozen_string_literal: true

module Types
  class ProfileType < BaseObject
    field :id, ID, null: false
    field :cid_or_passport, String, null: false
    field :kyc_status, Types::KycStatusEnum, null: false
    field :documents_url, [String], null: false
    field :avatar_url, String, null: true

    def documents_url
      object.documents.blobs.each_with_object([]) do |blob, array|
        array << rails_blob_url(blob, only_path: true)
      end
    end

    def avatar_url
      return if object.avatar.blob.nil?

      rails_blob_url(object.avatar.blob, only_path: true)
    end
  end
end
