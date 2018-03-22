# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    if (authenticated_user = User.find_by(id: session[:user_id]))
      Current.user = authenticated_user
    else
      redirect_to(login_path)
    end
  end
end
