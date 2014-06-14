class DashboardController < ApplicationController
	def index
		@users = User.all
		@events = Event.all
	end

  def json
    # nearby_memories = Memory.nearby(params[:latitude], params[:longitude])
    # memory_to_send = nearby_memories.sample

    # render json: memory_to_send, status: 200 # :ok

    all_events = Event.all
    render json: all_events, status: 200
  end
end