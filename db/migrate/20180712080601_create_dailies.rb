class CreateDailies < ActiveRecord::Migration[5.1]
  def change
    create_table :dailies do |t|
      t.date :date, null:false
      t.timestamps
    end
  end
end
