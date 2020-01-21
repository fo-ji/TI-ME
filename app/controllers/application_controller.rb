class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameteres, if: :devise_controller?

  protected

  def configure_permitted_parameteres
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :profile, :avatar, :avatar_cache, :remove_avatar])
  end
end