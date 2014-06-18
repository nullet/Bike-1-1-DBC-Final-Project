class RequestsController < WebsocketRails::BaseController
    before_action :authenticate_user!

  def create
    @event        = Event.new(message)
    @event.active = true
    @user         = current_user
    # @event.requester_id = (1 + rand(4))
    # @event.active = true
    # @event.latitude = 41.880654 # will need to come in through phone
    # @event.longitude = -87.634252 # will need to come in through phone
    # @event.request_text = "Hey" # will need to comin in through phone

    respond_to do |format|
      if @event.save
         @user.requests << @event
         format.html { redirect_to @event, notice: 'Event was successfully created.' }
         format.json { render json: @event, status: 201, location: @event }
         WebsocketRails[:request].trigger('new_request', { location: { :request_text => @event.request_text,
                                                                       :requester_id => @event.requester_id,
                                                                       :latitude     => @event.latitude,
                                                                       :longitude    => @event.longitude,
                                                                       :active       => @event.active,
                                                                       :event_id     => @event.id,
                                                                       :first_name   => @user.first_name,
                                                                       :karma_count => @user.karma_count,
                                                                                                           }}.to_json)
      else
        # talk to swift team to decide what they need for the situation where it doesn't save
        WebsocketRails[:request].trigger('new_request', { :error => @event.errors }.to_json)
        # format.html { render :new }
        # format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
    # logger.info("creating event")
    # format.json { {wheee: "whooo"} }
    # WebsocketRails[:request].trigger('new_request', { :wooooo => message }.to_json)
  end
end
