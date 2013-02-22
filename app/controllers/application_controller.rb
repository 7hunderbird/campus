class ApplicationController < ActionController::Base
  protect_from_forgery
  # Devise authenciation
  before_filter :authenticate_user!
    
  # Handle cancan exceptions and place to fall out safely to.
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
