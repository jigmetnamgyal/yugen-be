# frozen_string_literal: true

module Resolvers
  class CommentsResolver < PaginationBase
    graphql_name 'comments'

    scope { Comment.all }

    type Types::CommentType.connection_type, null: false

    option :type, type: Types::CommentTypeEnum, with: :filter_comments

    def filter_comments(scope, value)
      value == 'grant' ? scope.where(commentable_type: 'Grant') : scope.where(commentable_type: 'Project')
    end
  end
end
