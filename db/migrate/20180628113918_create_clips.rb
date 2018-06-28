class CreateClips < ActiveRecord::Migration[5.1]
  def change
    create_table :clips do |t|
      t.references :user, null:false, foreign_key:true, index: true
      t.string :image
      t.integer :likes_count
      t.timestamps
    end
  end
end
