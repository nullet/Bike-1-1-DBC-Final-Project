class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create!(user_params)
		@user.karma_count = 0
		@user.hb_radius = 10
		@user.save

		redirect_to users_path
	end

	def update
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :phone, :home_base, :hb_radius)
	end
end
