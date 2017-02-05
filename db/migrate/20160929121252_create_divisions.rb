class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
    	t.integer :main
    	# t.integer :sub_division
    	# t.integer :third_division
      t.integer :for, default: 1
    	t.text :description
    	


      t.timestamps null: false
    end
  end
end
