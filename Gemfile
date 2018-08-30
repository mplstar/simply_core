source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.1'
# gem 'rake', '< 11.0'

# Use sqlite3 as the database for Active Record
gem 'mysql2', '~> 0.3.18'  ## for dev and prod

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
# gem 'coffee-rails', '~> 4.2.2'
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
gem 'byebug', group: [:development, :test]

gem 'sinatra'

###  application specific gems ####
gem 'haml-rails'
gem 'rest-client'
gem 'will_paginate'
gem 'whenever', :require => false

group :development, :test do
  gem 'rspec_api_documentation', '0.9.2'
  # gem 'rspec_api_documentation', '5.1.0'
  # gem 'raddocs'
  # gem 'apitome'
end

group :test do
  # gem 'rspec-rails', "3.6.0"
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'rspec-activemodel-mocks'
  gem 'shoulda-matchers'
  gem 'factory_bot_rails'
  gem 'rubocop-rspec'
  gem 'capybara'

  gem 'sqlite3'
  gem 'test-unit'
  # gem 'minitest'
end

gem 'delayed_job_active_record'
gem 'daemons'
