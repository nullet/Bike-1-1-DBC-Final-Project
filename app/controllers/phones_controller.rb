class PhonesController < ApplicationController
	# respond_to :json

	def index
		@events = Event.all
		# puts "auth_token: #{@current_user.id}"
		render json: @events, status: 200
	end

	def login
		@user = User.find_by_email(params[:email])
		puts @user
		if @user
			render json: {"token" => @user.authentication_token}, status: 201 if @user.valid_password?(params[:password])
		else
			render json: {"token" => "Unauthorized"}, status: 401
		end
	end

	def show
		# @event = Event.find_by_id(params[:id])

		# render json: @event, status: 200
	end

	def new
		@event = Event.new
	end

	def create
		puts "8" * 1500
		puts params.inspect
		@event = Event.new(request_text: params["text "], latitude: params["latitude"], longitude: params["longitude"])
		@event.active = true
		@event.requester_id = User.find_by_authentication_token(params["token"]).id
		if @event.save
			render json: @event, status: 201, location: @event
			#render nothing: true, status: 204, location: @event # returns empty response body
		end
	end

	# private
	# 	def event_params
	# 		params.require(:event).permit(:requester_id, :responder_id, :latitude, :longitude, :active, :request_text)
	# 	end
end
