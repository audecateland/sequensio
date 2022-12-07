class ApplicationController < ActionController::Base
  before_action :authenticate_user!

#### This is for add :spotify_key to user ####

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:spotify_key, :email, :password)}

      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:spotify_key, :email, :password, :current_password)}
    end

###############################################

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end
