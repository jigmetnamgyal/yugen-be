# frozen_string_literal: true

class GrantCommentAdder < ApplicationService
  def call
    Comment.create!(sanitize_params)
  end

  def sanitize_params
    grant = Grant.find(params.delete(:grant_id))

    params.merge!(
      user_id: current_user.id,
      commentable: grant
    )
  end
end
