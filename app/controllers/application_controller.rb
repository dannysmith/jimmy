# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication
  include SetCurrentRequestDetails

  protect_from_forgery with: :exception
end
