class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.float :budget

      t.timestamps null: false
    end
  end
end
