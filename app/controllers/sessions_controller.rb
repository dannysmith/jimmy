# frozen_string_literal: true

# This controller handles creating and destroying sessions.
class SessionsController < ApplicationController
  skip_before_action :authenticate # Provided by 'Authentication'

  def new
    redirect_to(dashboard_path) if session[:user_id]
  end

  def create
    req = CreateSessionRequest.new(params)
    if req.valid_oauth_login?
      # Create session
    elsif req.invalid_oauth_login_for_user_with_email_already_registered?
      # Oauth is okay, but a user already exists with that email.
      # Kick out with a message telling user to log in and connect provider.
    elsif req.invalid_oauth_login_for_new_user?
      # This is probably a new user.
      # Kick into signup flow
    elsif req.valid_password_login?
      # Create Session
    else
      # Not a valid signin attempt.
      redirect_to(login_path, notice: 'Incorrect login details')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(login_path, notice: "You've been logged out")
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

  private

  def session_params
    params.permit(
      :username_or_email,
      :password,
    )
  end
end
