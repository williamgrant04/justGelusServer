class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.date :appt_date_time
      t.boolean :at_home

      t.timestamps
    end
  end
end
