# frozen_string_literal: true

# A Global representing the current user
class Current < ActiveSupport::CurrentAttributes
  attribute :request_id, :user_agent, :ip_address, :user, :context

  # Retursn a hash of details for the current request that might be useful
  #  when debugging or logging output.
  def self.request_details
    {
      request_id: request_id,
      user_agent: user_agent,
      ip_address: ip_address,
      user_id: user&.id,
      context: context
    }
  end

  # Adds an entry to the "context" array on the current request.
  # Useful for logging when logged or inspected in the console.
  def self.ctx(string)
    self.context ||= []
    unless string.is_a? String
      Rails.logger.warn "#{self}::ctx expects a String; you have passed a #{string.class}. `#{string.class}#to_s` will be called."
    end
    self.context << string.to_s
  end
end
