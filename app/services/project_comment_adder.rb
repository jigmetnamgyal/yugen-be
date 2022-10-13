# frozen_string_literal: true

class ProjectCommentAdder < ApplicationService
  def call
    Comment.create!(sanitize_params)
  end

  def sanitize_params
    project = Project.find(params.delete(:project_id))

    params.merge!(
      user_id: current_user.id,
      commentable: project
    )
  end
end
