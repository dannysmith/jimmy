# frozen_string_literal: true

# A Global representing the current user
class Current < ActiveSupport::CurrentAttributes
  attribute :request_id, :user_agent, :ip_address, :user, :session
end
