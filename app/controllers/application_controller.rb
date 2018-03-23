# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Authentication
  include SetCurrentRequestDetails

  protect_from_forgery with: :exception

  # Look in /frontend for partials, too.
  prepend_view_path Rails.root.join('frontend')
end
