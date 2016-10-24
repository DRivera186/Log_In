class HistoriesController < ApplicationController

	



	private
  def history_params
    params.require(:history).permit(:amount, :lend_in, :borrower_id)
  end

end
