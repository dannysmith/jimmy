# frozen_string_literal: true

module Jimmy
  # Custom error handler to be used in all rescue blocks when dealing with errors and exceptions.
  class ErrorHandler
    def self.handle(error, severity = nil, metadata = {})
      # If no severity is provided, set it to the error's severity, otherwise
      #  to :error. The nil-check allows us to catch errors that do not inherit
      #  from Jimmy::Error, such as those from libraries.
      severity = error&.severity || :error if severity.nil?

      # Send errors to Sentry
      Raven.capture_exception(error, level: severity.to_s, extra: {error_metadata: metadata, context: Current.context})

      # Write the error message to the log
      log_error(error, severity)

      # Always return true
      true
    end

    def self.log_error(error, severity)
      Rails.logger.send(severity, build_message(error))
    end

    def self.build_message(error)
      "#{error.class}: #{error.message} [#{Time.now.utc}]\n#{Current.request_details.pretty_inspect}"
    end
    private_class_method :build_message
  end
end
