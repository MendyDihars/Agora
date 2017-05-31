class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :store_current_location, :unless => :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name,
     :age, :bio, :address, :photo, :user_skill_ids])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :age, :bio, :address, :photo])
  end

  private

  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(resource)
    request.referrer || root_path
  end
end
