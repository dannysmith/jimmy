# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.4.2'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Basics
gem 'rails', '~> 5.1.4'

# Databases
gem 'pg'
gem 'redis', '~> 3.0'

# Server
gem 'puma', '~> 3.7'
gem 'rack-timeout'

# Styling
gem 'sass-rails', '~> 5.0'

# Javascript
gem 'react-rails'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

# Logging
gem 'lograge'
gem 'shog'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Performance
gem 'turbolinks', '~> 5'

# API
gem 'jbuilder', '~> 2.5'

# Active Model/Record
gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password
gem 'paranoia', '~> 2.2' # Soft Deletion

group :development, :test do
  # Development
  gem 'awesome_print'
  gem 'better_errors' # Better Rails error pages
  gem 'binding_of_caller' # Required by better errors.
  gem 'byebug', platforms: %i[mri mingw x64_mingw] # Debugger. Call 'byebug'.
  gem 'dotenv-rails'
  gem 'meta_request' # Supporting gem for RailsPanel chrome extension.
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'

  # Testing
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'

  # Dynamic Analysis
  gem 'bullet' # N+1 Queries
  gem 'traceroute' # Rake tasks for finding unused routes and unreachable controllers

  # Static analysis
  gem 'brakeman',               require: false # Security audit
  gem 'bundler-audit',          require: false # Depenancy audit
  gem 'mdl',                    require: false # Markdown linter
  gem 'rails_best_practices',   require: false # Rails BP audit
  gem 'reek',                   require: false # Code Smell audit
  gem 'rubocop',                require: false # Code stle checker
  gem 'sandi_meter',            require: false # Sandi Metz' BP audit

  # static Analysis GUIs
  gem 'rubrowser',              require: false # Generate a ruby code dependency graph
  gem 'rubycritic',             require: false # GUI for other Static Analysis tools
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'simplecov', require: false # Code coverage
end

group :production do
  gem 'heroku-deflater'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
