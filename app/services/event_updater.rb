# frozen_string_literal: true

class EventUpdater < ApplicationService
  def call
    Event.find(params[:id]).tap do |event|
      event.update!(params)
    end
  end
end
