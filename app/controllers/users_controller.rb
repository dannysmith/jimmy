# frozen_string_literal: true

# This controller handles basic user management.
class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # Provided by 'Authentication'
  skip_before_action :authenticate, only: %i[new create]

  def show; end

  def new
    redirect_to(dashboard_path) if session[:user_id]
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id # Store a session.
      redirect_to('/dashboard', notice: "You're all signed up!")
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to(@user, notice: 'Updated!')
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to(users_url, notice: 'User has been deleted!')
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :primary_email,
      :username,
      :avatar,
      :password,
      :password_confirmation,
    )
  end
end
