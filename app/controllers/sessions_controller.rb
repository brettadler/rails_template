class SessionsController < Devise::SessionsController

  def create
    super
    session[:remember_email] = current_user.remember_me ? current_user.email : ""
  end

  def destroy
    # Since our session gets destroyed on logout we'll need to resave it after
    email_to_cache = session[:remember_email]
    super
    session[:remember_email] = email_to_cache
  end

end
