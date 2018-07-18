class Folder < ApplicationRecord
  belongs_to :user
  has_many :folder_clips
end
