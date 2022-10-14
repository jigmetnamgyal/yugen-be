# frozen_string_literal: true

class EventCreator < ApplicationService
  def call
    Event.create!(params.merge(user_id: current_user.id))
  end
end
