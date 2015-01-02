class EventsController < ApplicationController
  before_action :event_count, :remaining_slots, :set_event, only: [:show, :edit, :update, :destroy]
  #before_filter :authorize

  #helper_method :event_count
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    :set_event
    :event_count
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
    @event.user_id = current_user.id if current_user

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
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

  #get the total number of attendees
  helper_method :event_count
  def event_count
    @count = Attendee.count(:id => params[:id])
  end

  #get the number of remaining slots left
  helper_method :remaining_slots
  def remaining_slots
    #load current event
    @event = Event.find(params[:id])
    #get the count of the event from the event_count action
    count = self.event_count
    #get the cap from the current event
    cap = @event.event_cap

    #TEMP fix to deal with nil caps, caps mandatory in later release
    if cap != nil
      #return the value
      @remaining = cap - count
    else
      @remaining = 0
    end
  end


  #attend the event
  def register
    @event = Event.find(params[:id])

    found = false

    if current_user.nil?
      redirect_to "/login"
    else
      #see if user is already registered for the event
      begin
        registration_status = Attendee.where("user_id = ? AND event_id = ?", current_user.id, params[:id])
        found = true
      rescue ActiveRecord::RecordNotFound => e
        #not found
        if registration_status != nil
          found = true
        end
      end

      #if user is already registered, notify them and do nothing
      #register them for the event if they are not already attending
      if found
        flash[:notice] = "You are already registered for this event.  No further action is required."
      else
        Attendee.create(:user_id => current_user.id, :event_id => params[:id], :volunteer => false)
        flash[:notice] = "REGISTERED!"
      end

      render 'show'
    end
  end

  helper_method :get_attendees
  def get_attendees
    @attendees = Attendee.find(params[:id])
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:date, :end_date, :start_time, :end_time, :paid, :private, :description, :document, :event_cap, :price, :name, :user_id)
  end

end
