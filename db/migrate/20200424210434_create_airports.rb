class CreateAirports < ActiveRecord::Migration[6.0]
  def change
    create_table :airports do |t|
      t.string :city
      t.string :state
      t.string :country
      t.string :code

      t.timestamps
    end
  end
end
