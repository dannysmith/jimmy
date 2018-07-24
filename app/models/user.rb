# frozen_string_literal: true

# The User model represents individual users in the system.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  RESERVED_USERNAMES = %w[admin superuser administrator root jimmy].freeze

  JIMMY_ADMINISTRATORS = %w[dannysmith].freeze

  # Fields and Relations
  has_one_attached :avatar

  # Validations
  validates :name, presence: true, length: {maximum: 300}
  validates :username, uniqueness: true, exclusion: {in: RESERVED_USERNAMES}
  validates :email, uniqueness: true, format: /\A.+@.+\z/

  # Class Methods
  def self.lookup_by_email_or_username(email_or_username)
    find_by(username: email_or_username) ||
      find_by(email: email_or_username)
  end

  def jimmy_admin?
    JIMMY_ADMINISTRATORS.include? username
  end

  # Override ActiveRecord getter because hstore returns keys as strings.
  def metadata
    return unless self[:metadata]
    self[:metadata].deep_symbolize_keys
  end
end
