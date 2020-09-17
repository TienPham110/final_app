class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale
    
    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end
    
    # def set_locale
    #     locale = params[:locale].to_s.strip.to_sym
    #     I18n.locale = I18n.available_locales.include?(locale) ?
    #     locale : I18n.default_locale
    # end
        
    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:firstName, :lastName])
        devise_parameter_sanitizer.permit(:account_update, keys: [:firstName, :lastName,:email , :current_password, :password_confirmation, :password, :avatar])
    end
end
