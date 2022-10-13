# frozen_string_literal: true

module Types
  class CommentType < BaseObject
    field :id, ID, null: false
    field :comment, String, null: false
    field :user, Types::UserType, null: false
  end
end
