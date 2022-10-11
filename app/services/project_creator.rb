# frozen_string_literal: true

class ProjectCreator < ApplicationService
  def call
    binding.pry
    Project.create!(params.merge!(user_id: current_user.id))
  end
end
