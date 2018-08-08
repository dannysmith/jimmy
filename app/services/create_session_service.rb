# frozen_string_literal: true

class CreateSessionRequest
  def initialize(request)
    @params = request.params
    @oauth_details = request.env["omniauth.auth"]
  end

  def valid_oauth_login?; end
  def invalid_oauth_login_for_user_with_email_already_registered?; end
  def invalid_oauth_login_for_new_user?; end
  def valid_password_login?; end


    # if oauth_details # This is an OAuth login...
    #   # 1. Can I find a user with this set of details?
    #   #    YES They are the user.
    #   #    NO We need to create one. Kick out to User creation stuff.
    #   user = User.from_omniauth(oauth_details)
    # else
    #   # This is a normal login
    #   user = User.lookup_by_email_or_username(session_params[:username_or_email])
    # end

    # # Now we have the user, we can look for an existing session for them.
    # if user&.authenticate(session_params[:password])
    #   session[:user_id] = user.id # Store a session
    #   redirect_to(dashboard_path)
    # else
    #   redirect_to(login_path, notice: 'Incorrect login details')
    # end
  end
end