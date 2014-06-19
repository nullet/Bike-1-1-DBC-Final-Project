class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		@events = Event.where(active: true)
	end

  def karma
    @users = User.all
  end
end
