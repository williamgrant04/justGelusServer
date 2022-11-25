class AddNotesToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :notes, :text
  end
end
