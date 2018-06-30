class Clip < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ClipImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
