# frozen_string_literal: true

class AddCommentableToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :commentable, polymorphic: true, null: false
  end
end
