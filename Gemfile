# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Basics
gem 'rails', '~> 5.1.4'

# Databases
gem 'redis', '~> 3.0'
gem 'sqlite3'

# Server
gem 'puma', '~> 3.7'

# Styling
gem 'sass-rails', '~> 5.0'

# Javascript
gem 'uglifier', '>= 1.3.0'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Performance
gem 'turbolinks', '~> 5'

# API
gem 'jbuilder', '~> 2.5'

# Active Model
gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password

group :development, :test do
  # Development
  gem 'byebug', platforms: %i[mri mingw x64_mingw] # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'dotenv-rails'
  gem 'pry-doc'
  gem 'pry-rails'

  # Testing
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
