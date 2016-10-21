class UsersController < ApplicationController
  before_action :current_user, only:[:edit, :update, :delete_user]
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]

  def index
  end

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
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(current_user.id)
    user.update(first_name: params[:first_name], last_name: params[:last_name], city: params[:city], state: params[:state], email: params[:email])
      if user.save 
        redirect_to "/users/#{user.id}"
      else
        flash[:errors] = user.errors.full_messages
        redirect_to :back
     end
  end

  def destroy

  end

 private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :email, :password)
  end
end
