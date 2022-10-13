# frozen_string_literal: true

module Mutations
  class CommentOnProject < BaseMutation
    class CommentOnProjectAttributes < Types::BaseInputObject
      argument :project_id, Integer, required: true, description: 'Send project id'
      argument :comment, String, required: true
    end

    argument :attributes, CommentOnProjectAttributes, required: true
    type Types::CommentType

    def resolve(attributes:)
      ProjectCommentAdder.call({ params: attributes.to_h, current_user: current_user })
    end
  end
end
