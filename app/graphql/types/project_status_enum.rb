# frozen_string_literal: true

module Types
  class GrantStatusEnum < Types::BaseEnum
    value 'inactive'
    value 'approved'
    value 'rejected'
  end
end
