class Clip < ApplicationRecord
# マージする際にはコメントアウトを戻す
  # belogns_to :user

  mount_uploader :image, ClipImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
