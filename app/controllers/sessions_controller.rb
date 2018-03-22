# frozen_string_literal: true

# This controller handles creating and destroying sessions.
class SessionsController < ApplicationController
  skip_before_action :authenticate # Provided by 'Authentication'

  def new
    redirect_to(dashboard_path) if session[:user_id]
  end

  def create
    user = User.lookup_by_email_or_username(session_params[:username_or_email])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id # Store a session
      redirect_to(dashboard_path)
    else
      redirect_to(login_path, notice: 'Incorrect login details')
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(login_path, notice: "You've been logged out")
  end

  private

  def session_params
    params.permit(
      :username_or_email,
      :password,
    )
  end
end
