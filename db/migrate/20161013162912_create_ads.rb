class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.references :campaign, index: true, foreign_key: true
      t.string :title
      t.text :description
      t.integer :type

      t.timestamps null: false
    end
  end
end
