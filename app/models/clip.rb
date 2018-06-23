class Clip < ApplicationRecord
# ユーザー機能の開発終後にuser_idを追加予定_その後コメント削除
  # belogns_to :user

  mount_uploader :image, ClipImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
