class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  helper_method :current_user_session, :current_user
  
  # before controller method
  # force a path to be available only with a connected user
  def require_user
    unless current_user
      store_location
      flash[:notice] = t(:session_login_needed)
      redirect_to new_user_session_path
      return false
    end
  end
  
  # before controller method
  # force a path to be available only without a connected user
  def require_no_user
    if current_user
      store_location
      flash[:notice] = t(:session_logout_needed)
      redirect_to user_path(current_user)
      return false
    end
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def require_admin
    if current_user.role.title != "admin"
      flash[:notice] = t(:bad_credentials)
      store_location
      redirect_to root_path
      return false
    end
  end
  
  # store the current path location
  def store_location
    session[:return_to] = request.fullpath
  end
  
  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
end
