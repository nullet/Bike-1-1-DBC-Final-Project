class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@users = User.all
		@events = Event.all
	end

	# def new
	# 	@user = User.new
	# end

	def show
		@user = User.find_by_id(params[:id])
	end

	def lat_long
		@user = current_user

		render json: {latitude: @user.hb_latitude, longitude: @user.hb_longitude }
	end
	
	# def create
		# @user = User.create!(user_params)
		# @user.karma_count = 0
		# @user.hb_radius = 10
		# @user.save

		# redirect_to users_path
	# end

	def update
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :phone, :home_base, :hb_radius)
	end
end
