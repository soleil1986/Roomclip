class CreateClips < ActiveRecord::Migration[5.1]
  def change
    create_table :clips do |t|
      t.string :image
      t.integer :likes_count
      t.timestamps null: false
    end
  end
end
