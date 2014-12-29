class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.date :date
      t.date :end_date
      t.time :start_time
      t.time :end_time
      t.boolean :paid
      t.boolean :private
      t.text :description
      t.text :document
      t.integer :event_cap

      t.timestamps
    end
  end
end
