# frozen_string_literal: true

module Jimmy
  # Abstract Error class
  #
  # * All errors should inherit from Jimmy::Error
  # * Takes additional metadata and severity.

  class Error < StandardError
    attr_reader :metadata, :severity

    def initialize(message, severity = :error, metadata = {})
      super(message)
      @metadata = metadata
      @severity = severity
    end

    def user_message
      I18n.t('errors.unknown')
    end
  end
end
