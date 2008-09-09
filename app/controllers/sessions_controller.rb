# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  #include AuthenticatedSystem
#before_filter :login_required

  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      redirect_to(orders_path)
      flash[:notice] = "Logged in successfully"
      session[:logged_in] = "set"
      session[:username] = params[:login]
    else
      render :action => 'new'
    end
  end

  def destroy
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
