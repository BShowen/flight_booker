class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.references :booking
      t.timestamps
    end
  end
end