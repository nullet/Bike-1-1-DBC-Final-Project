class DashboardController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@users = User.all
		@events = Event.all
	end
end