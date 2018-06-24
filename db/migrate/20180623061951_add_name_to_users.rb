class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :text
  end
end
