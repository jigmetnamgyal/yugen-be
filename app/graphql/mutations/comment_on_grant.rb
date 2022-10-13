# frozen_string_literal: true

module Mutations
  class CommentOnGrant < BaseMutation
    class CommentOnGrantAttributes < Types::BaseInputObject
      argument :grant_id, Integer, required: true, description: 'Send grant id'
      argument :comment, String, required: true
    end

    argument :attributes, CommentOnGrantAttributes, required: true
    type Types::CommentType

    def resolve(attributes:)
      GrantCommentAdder.call({ params: attributes.to_h, current_user: current_user })
    end
  end
end
