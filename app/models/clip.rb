class Clip < ApplicationRecord
  belogns_to :user

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
