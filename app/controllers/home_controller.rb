class HomeController < ApplicationController
	before_filter :current_user
	def index
	
	end

	def home
		#Collection to display all events in the system
		@events = Event.where(private = false)
		@users = User.all
	end

end
