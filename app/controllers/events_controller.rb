class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  #respond_to :html, :json
  
  # GET /events
  # GET /events.json
  def index
    @events = Event.where(active: true)

    respond_to do |format|
      format.html { render :index }
      format.json { render json: json }
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
    @event = Event.new(event_params)
    @event.requester_id = current_user.id
    @event.active = true
    # @event.latitude = current_user.hb_latitude
    # @event.longitude = current_user.hb_longitude

    respond_to do |format|
      if @event.save
        format.html { redirect_to dashboard_path, notice: 'Event was successfully created.' }
        # format.json { render :show, status: :created, location: @event }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @event.responder_id = current_user.id
    @event.active = false
    current_user.gain_karma

    respond_to do |format|
      if @event.save
        format.html { redirect_to dashboard_path, notice: " Please contact the requester #{@event.requester.first_name} at #{@event.requester.phone} and let them know your on the way!." }
        format.json { render json: @event, status: :created, location: @event }
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
      params.require(:event).permit(:requester_id, :responder_id, :latitude, :longitude, :active, :request_text, :address)
    end
end
