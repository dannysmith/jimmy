# frozen_string_literal: true

# This is an example worker. It does nothing useful, but
#   along with its associated test and rake task it shows
#   the pattern for how workers should be written in Jimmy

class ExampleWorker
  include Sidekiq::Worker
  sidekiq_options queue: :scheduled_tasks, retry: false

  def perform(name, email)
    # IMPORTANT: In real workers, don't pur your logic here. Put it
    #            in a seperate module or class.
    # See https://dev.to/jamby1100/coding-sidekiq-workers-the-right-way-4jij

    Rails.logger.info 'Starting Example Worker'

    # Do something
    User.create(name: name,
                username: name.downcase.tr(' ', ''),
                email: email,
                password: 'password123')

    sleep 20 unless Rails.env.test? # Simulate a slow task

    Rails.logger.info 'Example Worker Finished'
  end
end
