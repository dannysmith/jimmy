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

  # TODO: Abstract this complexity to somewhere else.
  # An intemediary step is needed when signing UP via OAuth:
  #   1. Check if the email is already registered. If so, kick out.
  #   2. Show a form and ask the user to pick a username and password. Pre-fill the username field.
  #   3. Use that data, and the data from `auth` to create a new user adnd login like normal.
  #
  # The process when signing IN is similar, but not the same.
  #   1. Check for an existing user via provider and auth UID.
  #   2. If none exists (they have never oauthed before), check the users for any accounts with the same email.
  #   3. If another account with the same email exists, kick them out with instructions to log in and like accounts.
  #   4. If no other account exists, kick off the sign UP flow.
  #
  # We also need a process for linking an account once a user has logged in via username/password.
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.primary_email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      # user.avatar_url = auth.info.image
      user.name = auth.info.name
      user.username = auth.info.nickname
      user.oauth_token = auth.credentials.token
      user.password = 'Hahahahaha. TODO: Change the way this works'
      user.save!
    end
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
