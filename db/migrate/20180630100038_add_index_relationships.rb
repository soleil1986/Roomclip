class AddIndexRelationships < ActiveRecord::Migration[5.1]
  def change
   add_index :relationships, :follower_id
   add_index :relationships, :follow_id
   add_index :relationships, [:follower_id, :follow_id], unique: true
  end
end
