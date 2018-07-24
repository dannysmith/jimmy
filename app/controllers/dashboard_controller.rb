# frozen_string_literal: true

# This is a teporary controller to represent the App'sdashboard.
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index; end
end
