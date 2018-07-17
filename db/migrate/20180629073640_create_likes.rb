class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null:false
      t.integer :clip_id, null:false

      t.timestamps

      t.index :user_id
      t.index :clip_id
      t.index [:user_id, :clip_id], unique:true
#１ユーザが同じクリップに複数回いいねすることを防ぐ。
    end
  end
end
