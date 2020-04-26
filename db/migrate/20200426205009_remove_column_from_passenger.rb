class RemoveColumnFromPassenger < ActiveRecord::Migration[6.0]
  def change

    remove_column :passengers, :booking_id, :string
  end
end
