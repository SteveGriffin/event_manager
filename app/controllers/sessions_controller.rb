class SessionsController < ApplicationController

	def create
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id 
			session[:admin] = user.admin
			redirect_to "/home"
		else
			flash.now.alert = "Email or password is invalid"
			render plain: "Login failed"
		end
	end

	def destroy
		session[:user_id] = nil
		session[:admin] = nil
		redirect_to "/home"
	end

end
