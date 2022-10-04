# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/graphql', to: 'graphql#execute'
      post '/users', to: 'registration#create'
    end
  end
end
