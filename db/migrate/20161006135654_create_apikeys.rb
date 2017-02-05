class CreateApikeys < ActiveRecord::Migration
  def change
    create_table :apikeys do |t|
   	  t.string :access_token
      t.references :user, index: true

      t.timestamps
    end
    add_index :apikeys, :access_token, unique: true
  end
end
