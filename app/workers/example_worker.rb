# frozen_string_literal: true

# This is an example worker. It does nothing useful, but
#   along with its associated test and rake task it shows
#   the pattern for how workers should be written in Jimmy

class ExampleWorker
  include Sidekiq::Worker
  sidekiq_options queue: :scheduled_tasks, retry: false

  def perform(name, email)
    Rails.logger.info 'Starting Example Worker'

    # Do something
    User.create(name: name,
                username: name.downcase.tr(' ', ''),
                primary_email: email)

    sleep 20 unless Rails.env.test? # Simulate a slow task

    Rails.logger.info 'Example Worker Finished'
  end
end
