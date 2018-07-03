class Clip < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ClipImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

# clip詳細画面で、前の投稿に進むで使用
  def previous
    user.clips.order(id: :DESC).where("id < ?", id).first
  end

# clip詳細画面で、次の投稿に進むで使用
  def next
    user.clips.order(id: :ASC).where("id > ?", id).first
  end
end
