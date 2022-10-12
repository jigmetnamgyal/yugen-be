# frozen_string_literal: true

module Types
  class FundingInfoType < BaseObject
    field :id, ID, null: false
    field :funding_in_eth, Float, null: true
    field :funding_in_nu, Float, null: true
  end
end
