# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :uuid             not null, primary key
#  metadata        :hstore
#  name            :string           not null
#  password_digest :string
#  primary_email   :string           not null
#  username        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_username  (username)
#

# The User model represents individual users in the system.
class User < ApplicationRecord
  RESERVED_USERNAMES = %w[admin superuser administrator root jimmy].freeze

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

  # Override ActiveRecord getter because hstore returns keys as strings.
  def metadata
    return unless self[:metadata]
    self[:metadata].deep_symbolize_keys
  end
end
