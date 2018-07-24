# frozen_string_literal: true

class AddDeviseToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip
    end

    # Remove existing authentication fields
    remove_column :users, :primary_email
    remove_column :users, :password_digest

    # Add idnexes for new fields
    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end

  def self.down
    ## Database authenticatable
    remove_column :users, :email
    remove_column :users, :encrypted_password

    ## Recoverable
    remove_column :users, :reset_password_token
    remove_column :users, :reset_password_sent_at

    ## Rememberable
    remove_column :users, :remember_created_at

    ## Trackable
    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip

    # Remove idnexes for new fields
    remove_index :users, :email
    remove_index :users, :reset_password_token

    # Reverse Removal existing authentication fields
    add_column :users, :primary_email, :string
    add_column :users, :password_digest, :string
  end
end
