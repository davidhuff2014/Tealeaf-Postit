# encoding: UTF-8

# main application controller with protect_from_forgery
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # makes available to the whole application
  helper_method :current_user, :logged_in?, :require_user

  def current_user
    # if authenticated user, return the user obj
    # else return nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # turns into booleen 
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:error] = 'Must be logged in to perform this action.'
      redirect_to root_path
    end
  end
end
