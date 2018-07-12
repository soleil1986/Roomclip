class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable,
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, confirmation: true
  has_many :likes, dependent: :destroy

  # validates :name, presence: true
  # validates :email, uniqueness: true
  # validates :password, confirmation: true
  has_many :clips
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "follow_id",
                                   dependent:   :destroy
  has_many :follows, through: :active_relationships
  has_many :followers, through: :passive_relationships

  # ユーザーをフォローする
  def following(other_user)
    active_relationships.create(follow_id:other_user.id)
  end

  # ユーザーをアンフォローする
  def unfollowing(other_user)
    active_relationships.find_by(follow_id:other_user.id).destroy
  end

  #現在のユーザーがフォローしてたらtrueを返す
  def follow?(other_user)
    follows.include?(other_user)
  end

end
