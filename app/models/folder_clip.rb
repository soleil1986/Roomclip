class FolderClip < ApplicationRecord
  has_many :clips
  belongs_to :folder
end
