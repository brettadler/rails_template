class RegistrationsController < Devise::RegistrationsController

  def create
    params[:user].merge!(remember_me: 1)
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :invite_uuid, :remember_me)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  end

  protected

  # This method smells of :reek:UnusedParameters
  def after_sign_up_path_for(resource)
    root_path
  end

end
