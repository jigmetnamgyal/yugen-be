# frozen_string_literal: true

require 'dynamic_key'

module Agora
  class RtcTokenGenerator < ApplicationService
    def call
      return unless event

      AgoraDynamicKey::RTCTokenBuilder.build_token_with_uid(sanitize_params)
    end

    def sanitize_params
      {
        app_id: 'ea6bac18a714417484df3a62d4bc99b1',
        app_certificate: '20b2ea1e27d543dba96bd7504b51607e',
        channel_name: params[:event_id],
        uid: SecureRandom.hex(5),
        role: params[:role_id],
        privilege_expired_ts: Time.current.to_i + 3600
      }
    end

    def event
      @_event ||= Event.find(params[:event_id])
    end
  end
end
