class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :date_of_birth
      t.integer :age
      t.string :email

      t.timestamps null: false
    end
  end
end
