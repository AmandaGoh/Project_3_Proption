class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_account_update_params, if: :devise_controller?

protected


  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :contact_number, :email, :password, :password_confirmation])
  end

end
