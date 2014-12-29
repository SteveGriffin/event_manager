class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :f_name
      t.string :l_name
      t.string :email
      t.string :password_digest
      t.boolean :active
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :city
      t.string :state
      t.string :zip
      t.string :organization

      t.timestamps
    end
  end
end
