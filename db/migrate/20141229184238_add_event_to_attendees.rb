class AddEventToAttendees < ActiveRecord::Migration
  def change
    add_reference :attendees, :event, index: true
  end
end
