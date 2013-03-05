class ApplicationController < ActionController::Base
  protect_from_forgery
  # Devise authenciation
  before_filter :authenticate_user!
    
  # Handle cancan exceptions and place to fall out safely to.
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to root_url, :alert => exception.message
  # end

  # Then, add the following code to your ApplicationController:
  
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html do
        redirect_to admin_root_path, :alert => exception.message
      end
    end
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

end
