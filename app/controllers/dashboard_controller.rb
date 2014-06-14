class DashboardController < ApplicationController
	def index
		@users = User.all
		@events = Event.all
	end
end