class ApplicationController < ActionController::Base

    #configure addition field to the devise default sign_up parameters
    before_action :configure_additonal_parameters, if: :devise_controller?

  protected

  def configure_additonal_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :telephone])
  end

  rescue_from ActionController::RoutingError do |exception|
    logger.error 'Routing error occurred'
    render plain: '404 Not found', status: 404 
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    logger.error 'Routing error occurred'
    render plain: '404 Not found', status: 404 
  end

  rescue_from ActionView::MissingTemplate do |exception|
    logger.error exception.message
    render plain: '404 Not found', status: 404 
  end

end
