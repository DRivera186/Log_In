class UsersController < ApplicationController
  before_action :current_user, only:[:edit, :update, :delete_user]
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def new
  end

  def create
    user = User.new(user_params)
      if user.save 
        session[:user_id] = user.id
        redirect_to "/users/#{user.id}"
      else
        flash[:errors] = user.errors.full_messages
        redirect_to '/users/new'
     end
  end

  def show
    @user = User.find(current_user.id)
    @lender = Lender.joins(:histories).all
  end

 private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :money, :purpose, :raised, :description, :email, :password)
  end
end
