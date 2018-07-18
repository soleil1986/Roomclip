class CreateDailyclips < ActiveRecord::Migration[5.1]
  def change
    create_table :dailyclips do |t|
      t.references :daily, null:false, foreign_key:true, index: true
      t.integer :num, null:false
      t.references :clip, foreign_key:true
      t.timestamps
    end
  end
end

