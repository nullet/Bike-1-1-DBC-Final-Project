class DashboardController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@users = User.all
		@events = current_user.nearby_requests
	end

  def karma
    @users = User.all
  end
end