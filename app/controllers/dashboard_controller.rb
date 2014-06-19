class DashboardController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@users = User.all
		# @events = current_user.nearby_requests
    @events = Event.all
	end

  def karma
    @users = User.order('karma_count DESC')
  end
end