class CreateAppointmentservices < ActiveRecord::Migration[7.0]
  def change
    create_table :appointmentservices do |t|
      t.references :appointment, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
