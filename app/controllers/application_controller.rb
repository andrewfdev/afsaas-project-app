class ApplicationController < ActionController::Base
    skip_before_action :authenticate_tenant!, :only => ["reply", "show", "index"], :raise => false

    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
