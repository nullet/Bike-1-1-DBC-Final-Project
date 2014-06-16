class DashboardController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@users = User.all
		@user = current_user
		@events = Event.all
	end
end