# frozen_string_literal: true

namespace :examples do
  desc 'Example Task to show the form workers should take'
  task run_example_worker: :environment do
    ExampleWorker.perform_async('Mr Blobby')
  end
end
