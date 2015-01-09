require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
    #current_user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { date: @event.date, user_id: 1, description: @event.description, document: @event.document, end_date: @event.end_date, end_time: @event.end_time, event_cap: @event.event_cap, paid: @event.paid, private: @event.private, start_time: @event.start_time }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { date: @event.date, description: @event.description, document: @event.document, end_date: @event.end_date, end_time: @event.end_time, event_cap: @event.event_cap, paid: @event.paid, private: @event.private, start_time: @event.start_time }
    assert_response :success
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end

  # test "should return attendees" do

  # end

end
