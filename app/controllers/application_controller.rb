class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session

  before_action :ensure_authentication_token

  def ensure_authentication_token

    if current_user && current_user.authentication_token.blank?
      current_user.authentication_token = Devise.friendly_token
    end
  end


	def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || dashboard_path
  end
end
