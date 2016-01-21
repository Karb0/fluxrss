class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) << [:firstname, :lastname, :is_admin]
      devise_parameter_sanitizer.for(:account_update) << [:firstname, :lastname, :is_admin]
    end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
end
