# frozen_string_literal: true

class ProjectCreator < ApplicationService
  def call
    Project.create!(params.merge!(user_id: current_user.id))
  end
end
