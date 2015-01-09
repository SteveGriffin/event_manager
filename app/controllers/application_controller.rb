class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  #default date format: M / D / Y
  Date::DATE_FORMATS[:default] = '%m/%d/%Y'

  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "You must sign in to access this page." if current_user.nil?
  end
  
  def set_event
    @event = Event.find(params[:id])
  end
end
