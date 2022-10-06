# frozen_string_literal: true

module Types
  class KycStatusEnum < Types::BaseEnum
    value 'in_progress'
    value 'approved'
    value 'rejected'
  end
end
