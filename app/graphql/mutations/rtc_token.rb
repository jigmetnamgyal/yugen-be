# frozen_string_literal: true

module Mutations
  class RtcToken < BaseMutation
    class RtcTokenAttributes < Types::BaseInputObject
      argument :event_id, ID, required: true
      argument :role_id, Int, required: true
    end

    argument :attributes, RtcTokenAttributes, required: true
    field :rtc_token, String, null: true

    def resolve(attributes:)
      { rtc_token: Agora::RtcTokenGenerator.call({ params: attributes.to_h, current_user: current_user }) }
    end
  end
end
