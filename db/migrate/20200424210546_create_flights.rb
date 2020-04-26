class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_date
      t.integer :duration
      t.integer :flight_number
      t.references :departure_airport
      t.references :arrival_airport

      t.timestamps
    end
  end
end