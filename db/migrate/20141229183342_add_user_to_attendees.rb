class AddUserToAttendees < ActiveRecord::Migration
  def change
    add_reference :attendees, :user, index: true
  end
end
