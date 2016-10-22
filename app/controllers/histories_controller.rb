class HistoriesController < ApplicationController

	

	def create	
		user = User.find(params[:id]) 
		lender = Lender.find(current_lender.id) 
		history = history.new(history_params)
      if history.save 
      	history.amount < current_lender.money
        redirect_to action: "update"
      else
        flash[:errors] = "You do not have enough funds!"
        redirect_to :back
     end
  end

  def update
  	lender = Lender.find(current_lender.id)
    user = User.find((params[:id]))
    history = History.find(history_params)
    history.update(amount: params[:amount], user_id: params[:user_id], lender_id: params[:lender_id])
      if history.save 
        redirect_to "/lenders/#{lender.id}"
      else
        flash[:errors] = user.errors.full_messages
        redirect_to :back
     end
  end












	private
  def history_params
    params.require(:history).permit(:amount, :lend_in, :borrower_id)
  end

end
