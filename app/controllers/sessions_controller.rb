class SessionsController < ApplicationController

  def new
  end

	def login
		@user = User.find_by_email(params[:email])
			if @user
				@user.authenticate(params[:password])
				session[:user_id] = @user.id
				redirect_to "/users/#{@user.id}"
			else
				flash[:error] = "Invalid Login"
				redirect_to :back
			end
	end

	def destroy
		reset_session
    redirect_to action: "new"
	end


end
