class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.date :date_of_birth
    	t.string :gender
    	t.integer :age
      t.string :password

      t.timestamps null: false
    end
  end
end
