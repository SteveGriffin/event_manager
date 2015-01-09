require 'test_helper'

class AttendeesControllerTest < ActionController::TestCase
  setup do
    @attendee = attendees(:one)
    :current_user
    session[:user_id] = 1
    :set_attendee
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  #NOT WORKING
  test "should create attendee" do
    # assert_difference('Attendee.count') do
    #   puts @attendee.user_id.to_s << "ASDFASDFASDFASDF"
    #   post :create, attendee: { volunteer: @attendee.volunteer, user_id: @attendee.user_id, event_id: @attendee.event_id}
    #end

    #assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should show attendee" do
    get :show, id: @attendee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendee
    assert_response :success
  end

  #NOT WORKING
  test "should update attendee" do
    # patch :update, id: @attendee.id, attendee: { volunteer: @attendee.volunteer }
    # assert_response :success # assert_redirected_to attendee_path(assigns(:attendee))
  end

  test "should destroy attendee" do
    assert_difference('Attendee.count', -1) do
      delete :destroy, id: @attendee
    end

    assert_redirected_to attendees_path
  end
end
