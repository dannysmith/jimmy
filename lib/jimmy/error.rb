# frozen_string_literal: true

module Jimmy
  # Abstract Error class
  #
  # * All errors should inherit from Jimmy::Error
  # * Takes additional metadata and severity.
  class Error < StandardError
    PERMITTED_SEVERITIES = %i[debug info warn error fatal].freeze
    attr_reader :metadata, :severity

    def initialize(message, severity = :error, metadata = {})
      raise ArgumentError "Severity must be one of #{PERMITTED_SEVERITIES}" unless PERMITTED_SEVERITIES.include? severity

      super(message)
      @metadata = metadata
      @severity = severity
    end

    def user_message
      I18n.t('errors.unknown')
    end
  end
end
