class CreateFolderClips < ActiveRecord::Migration[5.1]
  def change
    create_table :folder_clips do |t|
      t.integer       :folder_id
      t.integer       :clip_id
    end
  end
end
