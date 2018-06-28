class AddRoomNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :room_number, :integer
  end
end
