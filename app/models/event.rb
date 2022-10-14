# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  belongs_to :grant

  enum status: { upcoming: 0, live: 1, completed: 2 }
end
