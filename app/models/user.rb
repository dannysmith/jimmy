# frozen_string_literal: true

# The User model represents individual users in the system.
class User < ApplicationRecord
  RESERVED_USERNAMES = %w[admin superuser administrator root jimmy].freeze
  ADMINISTRATORS = %w[dannysmith].freeze

  # Fields and Relations
  has_secure_password
  has_one_attached :avatar

  # Validations
  validates :name, presence: true, length: {maximum: 300}
  validates :username, uniqueness: true, exclusion: {in: RESERVED_USERNAMES}
  validates :primary_email, uniqueness: true, format: /\A.+@.+\z/

  # Class Methods
  def self.lookup_by_email_or_username(email_or_username)
    find_by(username: email_or_username) ||
      find_by(primary_email: email_or_username)
  end

  # Instance Mathods

  def admin?
    ADMINISTRATORS.include? username
  end

  # Override ActiveRecord getter because hstore returns keys as strings.
  def metadata
    return unless self[:metadata]
    self[:metadata].deep_symbolize_keys
  end
end
