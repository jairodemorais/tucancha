class AddPlaceToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :place, :string
  end
end
