# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SetCurrentRequestDetails

  protect_from_forgery with: :exception

  # Look in /frontend for partials, too.
  prepend_view_path Rails.root.join('frontend')

  # Set up Additional Devise Parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name username])
  end
end
