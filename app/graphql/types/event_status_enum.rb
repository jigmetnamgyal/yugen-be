# frozen_string_literal: true

module Types
  class EventStatusEnum < Types::BaseEnum
    value 'upcoming'
    value 'live'
    value 'completed'
  end
end
