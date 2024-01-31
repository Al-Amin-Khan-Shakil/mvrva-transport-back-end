class AddClientNameToReservations < ActiveRecord::Migration[7.1]
  def change
    add_column :reservations, :client_name, :string
  end
end
