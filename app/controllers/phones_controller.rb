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
	end

	def create
		@event = Event.new(event_params)

		if @event.save
			render json: @event, status: 201, location: @event
			#render nothing: true, status: 204, location: @event # returns empty response body
		end
	end

	private
		def event_params
			params.require(:event).permit(:requester_id, :responder_id, :latitude, :longitude, :active, :request_text)
		end
end