class SessionsController < ApplicationController

  def create
		@user = User.find_by_email(params[:user][:email])
		if @user and @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			session[:name] = @user.first_name + " " + @user.last_name
			redirect_to '/songs'
		else
			flash[:log_error] = 'Please enter a valid Email and Password'
			redirect_to '/'
		end
	end

	def destroy
		session.clear
		redirect_to '/'
	end
end
