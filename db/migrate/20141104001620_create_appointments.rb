class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :appointments
      t.boolean :done
      t.datetime :date
      t.string :hour

      t.timestamps
    end
  end
end
