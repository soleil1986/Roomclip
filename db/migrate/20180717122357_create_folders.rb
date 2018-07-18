class CreateFolders < ActiveRecord::Migration[5.1]
  def change
    create_table :folders do |t|
      t.integer      :user_id
      t.string       :name
      t.timestamps
    end
  end
end
