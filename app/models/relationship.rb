class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :follow, class_name: "User"
  validates :follower_id, presence: true
  validates :follow_id, presence: true
end
