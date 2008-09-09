# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # from users plugin
  include AuthenticatedSystem
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_hotel_orders4_session_id'
  
  include AuthenticatedSystem

  helper_method :admin?
  
  layout 'application'
  
  private
  
  def find_cart
    session[:cart] ||= Cart.new
  end

  def admin?
    session[:logged_in]
  end
  
end
