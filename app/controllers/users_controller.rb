class UsersController < ApplicationController

    def index
    end

    def create
	    user = User.new(user_params)
		if user.save
			flash[:req_login] = 'Successfully Registered! Please log in'
			redirect_to '/'
		else
			flash[:reg_errors] = user.errors.full_messages
			redirect_to '/'
		end
	end

	def show
		@user = User.find(params[:id])
		@songs = @user.songs
	end
   

    private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
