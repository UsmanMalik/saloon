class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.text :description
      t.integer :age
      t.string :email
      t.string :phone_number
      t.string :address
      t.boolean :status
      

      t.timestamps null: false
    end
  end
end
