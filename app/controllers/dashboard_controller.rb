class DashboardController < ApplicationController
	before_filter :authorize

	def index
		current_user_id = session[:user_id]

		@events = Event.where("user_id = ?", current_user_id)
	end
end
