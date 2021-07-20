class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.datetime :time
      t.integer :pax
      t.string :code
      t.boolean :confirmed

      t.timestamps
    end
  end
end
