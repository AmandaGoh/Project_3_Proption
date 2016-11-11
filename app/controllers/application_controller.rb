class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

# to allow the new fields to be saved under edit

  before_action :configure_account_update_params, if: :devise_controller?

protected


  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :contact_number, :email, :password, :password_confirmation])
  end


#redirect user to home page after sign up/log in
  # def after_sign_in_path_for(resource)
  #   sign_in_url = new_user_session_url
  #   if request.referer == sign_in_url
  #     super
  #   else
  #     stored_location_for(resource) || request.referer || root_path
  #   end
  # end

end
