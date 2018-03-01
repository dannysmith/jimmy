# frozen_string_literal: true

# Custom error handler to be used in all rescue blocks when dealing with errors and exceptions.
module Jimmy
  class ErrorHandler
    def self.handle(error, severity = :error, metadata = {})
      # Send errors to Sentry
      Raven.capture_exception(error, level: severity.to_s, extra: metadata)

      # Write the error message to the log
      log_error(error, severity)
    end

    def self.log_error(error, severity)
      Rails.logger.send(severity, build_message(error))
    end

    private_class_method :build_message

    def self.build_message(error)
      "#{error.class}: #{error.message} [#{Time.now}]"
    end
  end
end
