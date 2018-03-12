# frozen_string_literal: true

# A Global representing the current user
class Current < ActiveSupport::CurrentAttributes
  attribute :account, :userattribute
  attribute :request_id, :user_agent, :ip

  resets { Time.zone = nil }

  def user=(user)
    super
    self.account = user.account
    Time.zone = user.time_zone
  end
end
