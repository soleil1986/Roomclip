class FolderClip < ApplicationRecord
  has_many :clips
  belogs_to :folder
end
