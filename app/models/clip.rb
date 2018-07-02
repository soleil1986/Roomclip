class Clip < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ClipImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

  def previous
    user.clips.order(id: :DESC).where("id < ?", id).first
  end

  def next
    user.clips.order(id: :ASC).where("id > ?", id).first
  end
end
