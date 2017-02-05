class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user
      t.date :appointment_date
      t.time :appointment_time
      t.string :detail
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
