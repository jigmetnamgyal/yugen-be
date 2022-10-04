# frozen_string_literal: true

GraphQL::Field.accepts_definitions(authenticate: GraphQL::Define.assign_metadata_key(:authenticate))
GraphQL::Schema::Field.accepts_definition(:authenticate)
