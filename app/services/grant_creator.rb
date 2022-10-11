# frozen_string_literal: true

class GrantCreator < ApplicationService
  def call
    Grant.create!(params.merge!(user_id: current_user.id))
  end
end
