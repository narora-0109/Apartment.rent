class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  private

  def logged_in?
    @current_user ||= User.find_by(name: session[:name])
    return session[:name] != nil
  end

  helper_method :logged_in?

  def authorize
    redirect_to root_url unless logged_in?
  end
end
