class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[name address teeth_type orthodontics_type profile_image])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name address teeth_type orthodontics_type profile_image])
  end

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
end
