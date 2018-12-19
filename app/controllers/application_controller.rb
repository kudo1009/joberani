class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :success, :info, :warning, :danger
  
  def after_sign_in_path_for(resource)
    user_path(@user.id)
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password,:password_confirmation, :town, :age, :gender, :introduce, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password,:password_confirmation, :town, :age, :gender, :introduce, :image])
  end
  
  private
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
  
  
end
