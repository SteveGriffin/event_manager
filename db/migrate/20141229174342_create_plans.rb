class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :plan_type
      t.string :plan_description
      t.decimal :price
      t.boolean :active
      t.boolean :recurring

      t.timestamps
    end
  end
end
