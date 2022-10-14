# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

gem 'bootsnap', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.3', '>= 7.0.3.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'apollo_upload_server', '2.0.5'
gem 'graphql', '~> 1.12.13'
gem 'jwt', '~> 2.5'
gem 'search_object'
gem 'search_object_graphql'

gem 'agora_dynamic_key', '~> 0.1.0'

group :development, :test do
  gem 'pry'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
