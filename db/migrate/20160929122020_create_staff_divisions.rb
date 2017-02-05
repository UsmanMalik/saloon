class CreateStaffDivisions < ActiveRecord::Migration
  def change
    create_table :staff_divisions do |t|
    	t.references :staff
    	t.references :division
    	t.string :summary

      t.timestamps null: false
    end
  end
end