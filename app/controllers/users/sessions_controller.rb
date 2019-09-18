class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: :create
  include SessionsHelper

  protected

  def after_sign_in_path_for resource
    if resource.admin?
      flash[:success] = t "welcome_admin"
      rails_admin_path
    else
      session[:forwarding_url] || root_url
    end
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit :sign_in, keys: [:email, :password]
  end
end
