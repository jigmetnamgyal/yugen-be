# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post '/graphql', to: 'graphql#execute'
      post '/users', to: 'registration#create'
      post '/users/sign_in', to: 'login#login'
      delete '/users', defaults: { format: :json }, to: 'logout#destroy'
    end
  end
end
