class EventsController < ApplicationController
  before_action :event_count, :remaining_slots, :get_attendee_information, :creator?, :set_event, only: [:show, :edit, :update, :destroy]
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
    :event_counts
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

  #get collection of attendees
  helper_method :event_count
  def event_count
    @count = Attendee.where(:event_id => params[:id])
  end

  #get the number of remaining slots left
  helper_method :remaining_slots
  def remaining_slots
    #load current event
    @event = Event.find(params[:id])
    #get the count of the event from the event_count action
    count = self.event_count.count
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
        #check the count of the returned object.  If greater than 0, user is already registered
        if registration_status.count > 0
          found = true
        end
      rescue ActiveRecord::RecordNotFound => e
        #not found
        # if registration_status > 0
        #   found = true
        # end
        puts e.to_s
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
    @attendees = Attendee.where(:event_id => params[:id])
  end

  #Load users who are attending this event.  .pluck returns array, possible use for future
  #helper_method :get_attendee_information
  def get_attendee_information
    @attendee_info = User.joins(:attendees).where(attendees: {event_id: params[:id]}) #.pluck(:email, :f_name, :l_name)
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

  #returns true or false depending on whether the user is the creator of the event
  def creator?
    if session[:user_id] == @event.id
      @creator = true
    else
      @creator = false
    end
  end

end
