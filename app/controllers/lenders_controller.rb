class LendersController < ApplicationController
	before_action :current_lender, only:[:edit, :update, :delete_user]
  before_action :require_login, except: [:new, :create]
  before_action :require_correct_lender, only: [:show, :edit, :update, :destroy]



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
  	@lender = Lender.find(params[:id])
    @user = User.all
    @lenders = User.joins(:histories).select("first_name", "last_name", "description", "purpose", "money", "raised", "amount").all
  end

  def update
	  	lend = History.create(amount: params[:donate], lender_id: current_lender.id, user_id: params[user.id])
		if current_lender.money < params[:donate].to_i
			flash[:error] = "You do not have the sufficient funds, please choose a lower amount or add more money."
		else
			withdraw = current_lender.money - params[:donate].to_i
			money = User.find(params[:id])
			transfer = money.raised + params[:donate].to_i
			money.update(raised: transfer)
			current_lender.update(money: withdraw)
		end
	  	redirect_to :back
  end

  private
  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :money, :email, :password)
  end


end
