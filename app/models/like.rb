class Like < ApplicationRecord
  belong_to :user, counter_cache: :likes_count
  belong_to :clip, counter_cache: :likes_count

  validates :user_id, presence: true
  validates :clip_id, presence: true
end
