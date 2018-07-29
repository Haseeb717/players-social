class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email, :password, :image,:password_confirmation,:user_id])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:name,:email, :password, :password_confirmation, :current_password,:image,:user_id])
	end
end
