class DashboardController < ApplicationController
	before_filter :authorize

	def index
		current_user_id = session[:user_id]

		@events = Event.all #Event.where("user_id = 4") #, current_user_id)
	end
end
