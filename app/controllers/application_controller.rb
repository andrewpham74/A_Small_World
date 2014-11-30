class ApplicationController < ActionController::Base
 # Prevent CSRF attacks by raising an exception.
 # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?

protected

 def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :name
   devise_parameter_sanitizer.for(:sign_up) << :user_countryname
   devise_parameter_sanitizer.for(:sign_up) << :user_continentname
   devise_parameter_sanitizer.for(:sign_up) << :user_city
   devise_parameter_sanitizer.for(:sign_up) << :user_interest
   devise_parameter_sanitizer.for(:sign_up) << :countries_to_see
   devise_parameter_sanitizer.for(:account_update) << :name
 end
end