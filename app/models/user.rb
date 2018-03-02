# frozen_string_literal: true

# The User model represents individual users in the system.
class User < ApplicationRecord
  RESERVED_USERNAMES = %w[admin superuser administrator root jimmy].freeze

  # Validations
  validates :name, presence: true, length: {maximum: 300}
  validates :username, presence: true, exclusion: {in: RESERVED_USERNAMES}
  validates :primary_email, presence: true, format: /@/

  # Override ActiveRecord getter because hstore returns keys as strings.
  def metadata
    return unless self[:metadata]
    self[:metadata].deep_symbolize_keys
  end
end
