class AddArchivedToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :archived, :boolean, default: false
  end
end
