class ApplicationController < ActionController::Base

    #configure addition field to the devise default sign_up parameters
    before_action :configure_additonal_parameters, if: :devise_controller?

  protected

  def configure_additonal_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone])
  end
end
