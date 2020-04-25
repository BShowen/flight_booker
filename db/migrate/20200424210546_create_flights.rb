class CreateFlights < ActiveRecord::Migration[6.0]
  def change
    create_table :flights do |t|
      t.datetime :departure_date
      t.integer :duration
      t.integer :flight_number
      t.integer :departure_airport_id
      t.integer :arrival_airport_id

      t.timestamps
    end
  end
end
