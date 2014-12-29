class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.boolean :volunteer

      t.timestamps
    end
  end
end
