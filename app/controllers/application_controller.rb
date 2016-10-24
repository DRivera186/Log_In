class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def current_lender
    Lender.find(session[:lender_id]) if session[:lender_id]
  end

  def require_correct_user
    user = User.find(params[:id])
    redirect_to "/users/#{current_user.id}" if current_user != user

  end

  def require_correct_lender
    lender = Lender.find(current_lender.id)
    redirect_to "/lenders/#{current_lender.id}" if current_lender != lender
  end

  def require_login
    if current_user 
    redirect_to '/sessions/new' if session[:user_id] == nil
    else current_lender
    redirect_to '/sessions/new' if session[:lender_id] == nil
    end
  end

  # def require_login_lender
  #   if current_lender
  #   redirect_to '/sessions/new' if session[:lender_id] == nil
  #   end
  # end

  helper_method :current_user
  helper_method :current_lender
  # helper_method :require_current_user
end
