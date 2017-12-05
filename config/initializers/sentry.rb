# frozen_string_literal: true

# Configure parameter sanitization in Sentry logs
Raven.configure do |config|
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
