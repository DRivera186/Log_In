class LendersController < ApplicationController
	before_action :current_lender, only:[:edit, :update, :delete_user]
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_lender, only: [:show, :edit, :update, :destroy]


  def index

  end

  def new

  end

  def create
    lender = Lender.new(lender_params)
      if lender.save 
        session[:lender_id] = lender.id
        redirect_to "/lenders/#{lender.id}"
      else
        flash[:error] = lender.errors.full_messages
        redirect_to '/users/new'
     end
  end

  def show
  	@user = User.all
    @lender = Lender.find(current_lender.id)
  end

  def edit
    @lender = lender.find(params[:id])
  end

  def update

  end

  private
  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :money, :email, :password)
  end


end
