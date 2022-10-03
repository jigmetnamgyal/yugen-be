# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 7.0.3', '>= 7.0.3.1'

gem 'pg', '~> 1.1'

gem 'puma', '~> 5.0'

# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

gem 'rack-cors'

group :development, :test do
  gem 'pry'
  gem 'rubocop-rails'
  gem 'rubocop-rake'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end
