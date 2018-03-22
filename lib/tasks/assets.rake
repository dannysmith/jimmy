# frozen_string_literal: true

# Override assets:precompile so that Heroku runs webpacker instead.
# See https://evilmartians.com/chronicles/evil-front-part-3

Rake::Task['assets:precompile'].clear
namespace :assets do
  desc 'Overrides default assets:precompile to use Webpacker instead.'
  task 'precompile' do
    puts 'Overriding default assets:precompile...'
    # Rake::Task['yarn:install'].execute
    # Rake::Task['webpacker:compile'].execute
  end
end
