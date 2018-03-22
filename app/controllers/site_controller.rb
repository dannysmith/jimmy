# frozen_string_literal: true

# This controller handles all basic, publically-available actions.
#  It is analogous to the welcome controller in most rails apps.
class SiteController < ApplicationController
  skip_before_action :authenticate # Provided by 'Authentication'

  def index; end
end
