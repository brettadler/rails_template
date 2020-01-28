module LoginHelper

  def signup_email
    if resource&.email.present?
      resource.email
    elsif params[:email].present?
      params[:email]
    # elsif resource&.invite_uuid.present?
    #   invite = UserInvite.unaccepteds.where(invite_uuid: resource&.invite_uuid).first
    #   invite.email
    # elsif params[:invite].present?
    #   invite = UserInvite.unaccepteds.where(invite_uuid: params[:invite]).first
    #   invite.email
    elsif session.key?(:remember_email)
      session[:remember_email]
    end
  end

  def signup_first_name
    if resource&.first_name.present?
      resource.first_name
    elsif params[:first].present?
      params[:first]
    # elsif params[:invite].present?
    #   invite = UserInvite.unaccepteds.where(invite_uuid: params[:invite]).first
    #   invite.first_name
    end
  end

  def signup_last_name
    if resource&.last_name.present?
      resource.last_name
    elsif params[:last].present?
      params[:last]
    # elsif params[:invite].present?
    #   invite = UserInvite.unaccepteds.where(invite_uuid: params[:invite]).last
    #   invite.last_name
    end
  end

  def remember_me_value
    if params.key?("user") && params["user"].key?("remember_me")
      params["user"]["remember_me"] == '1'
    else
      !session.key?(:remember_email) || (session.key?(:remember_email) && !session[:remember_email].empty?)
    end
  end

end
