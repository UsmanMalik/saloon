class CreateFences < ActiveRecord::Migration
  def change
    create_table :fences do |t|
    	t.references :ad, index: true, foreign_key: true
      	t.float :latitude
      	t.float	:longitude
      	t.float :radius

    	t.references 

      t.timestamps null: false
    end
  end
end
