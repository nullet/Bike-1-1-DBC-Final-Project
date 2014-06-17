class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user!

  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @events, status: 200 }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(request_text: params["text "])
    @event.requester_id = (1 + rand(4))
    @event.active = true
    @event.latitude = 41.88988 + (rand() / 100) # will need to come in through phone
    @event.longitude = -87.637017 - (rand() / 100) # will need to come in through phone
    # @event.request_text = "Hey" # will need to comin in through phone

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
        # format.json { render json: @event, status: 201, location: @event }
        # WebsocketRails[:request].trigger('new_mobile_request', {location: { :request_text => @event.request_text,
        #                                                                     :requester_id => @event.requester_id,
        #                                                                     :responder_id => @event.responder_id,
        #                                                                     :latitude     => @event.latitude,
        #                                                                     :longitude    => @event.longitude,
        #                                                                     :active       => @event.active }}.to_json)
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:requester_id, :responder_id, :latitude, :longitude, :active, :request_text)
    end
end
