class AddClientIdToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_reference :appointments, :client, index: true
    add_foreign_key :appointments, :clients
  end
end
