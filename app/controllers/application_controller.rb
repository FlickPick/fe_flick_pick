class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user ||= UserFacade.search_user(session[:user_id]) if session[:user_id]
  end

  def require_current_user
    redirect_to new_session_path unless current_user
    flash[:error] = "Please log in to access page"
  end
end
