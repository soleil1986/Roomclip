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

# いいねの多い写真順
  scope :popular_clip, -> { order("likes_count DESC") }
# 表示する写真枚数
  scope :displaynum_clip, -> { limit(12) }
# 投稿ユーザーの写真
  scope :user_clip, -> (user){ where(user_id: user) }
# 日毎の写真
  scope :dayly_clip,  -> (dayly){ where(created_at: dayly) }

end
