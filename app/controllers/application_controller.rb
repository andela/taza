class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_login
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private
  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in to access this section"
      redirect_to home_path  # halts request cycle
    end
  end
end
