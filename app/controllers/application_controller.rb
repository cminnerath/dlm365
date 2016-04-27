class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_filter :cor
  rescue_from ActionController::InvalidAuthenticityToken, :with => :bad_token

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  def logged_in?
    !current_user.nil?
  end

  def cor
    headers["Access-Control-Allow-Origin"]  = "*"
    headers["Access-Control-Allow-Methods"] = %w{GET POST PUT DELETE}.join(",")
    headers["Access-Control-Allow-Headers"] = %w{Origin Accept Content-Type X-Requested-With X-CSRF-Token}.join(",")
    head(:ok) if request.request_method == "OPTIONS"
  end

  def bad_token
    flash[:warning] = "Session expired"
    redirect_to root_path
  end
end
