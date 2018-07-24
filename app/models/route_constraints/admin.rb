# frozen_string_literal: true

# This constraint can used in the routes file.
#   See https://guides.rubyonrails.org/routing.html#advanced-constraints
#
module RouteConstraint
  class Admin
    def matches?(request)
      user = User.find_by(id: request.session[:user_id])
      user&.admin?
    end
  end
end
