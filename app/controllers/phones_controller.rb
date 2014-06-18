class PhonesController < ApplicationController
	# respond_to :json

	def index
		@events = Event.all

		render json: @events, status: 200
	end

	def show
		# @event = Event.find_by_id(params[:id])

		# render json: @event, status: 200
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(request_text: params["text "], latitude: params["latitude"], longitude: params["longitude"])
		@event.active = true
		@event.requester_id = rand(1..4)
		@user = User.find(event.requester_id)
		if @event.save
			render json: @event, status: 201, location: @event
			#render nothing: true, status: 204, location: @event # returns empty response body
			WebsocketRails[:request].trigger('new_mobile_request', { location: { :request_text => @event.request_text,
		                                                                       :requester_id => @event.requester_id,
		                                                                       :latitude     => @event.latitude,
		                                                                       :longitude    => @event.longitude,
		                                                                       :active       => @event.active,
		                                                                       :event_id     => @event.id,
		                                                                       :first_name   => @user.first_name,
		                                                                       :karma_count  => @user.karma_count,
                                                                                                           }}.to_json)
		end
	end

	# private
	# 	def event_params
	# 		params.require(:event).permit(:requester_id, :responder_id, :latitude, :longitude, :active, :request_text)
	# 	end
end