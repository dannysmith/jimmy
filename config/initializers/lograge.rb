# frozen_string_literal: true

Rails.application.configure do
  config.lograge.enabled = true

  config.lograge.keep_original_rails_log = (Rails.env.development? && !ENV['CONCISE_LOG'])

  config.lograge.custom_options = lambda do |event|
    {
      time: event.time,
      uid: event.payload[:uid],
    }
  end
end
