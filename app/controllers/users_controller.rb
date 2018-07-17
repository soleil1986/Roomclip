class UsersController < ApplicationController
  before_action :set_user, only: [:show, :photo_list, :mytag]

  def set_user
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @clips = @user.clips
    @tag_count = @clips.tag_counts_on(:tags).count
    @like_count = Like.where(user_id: @user.id).count
  end

  def follow
    @user = User.find(params[:id])
    @follows = @user.follows
    render 'myfollow'
  end

  def follower
    @user = User.find(params[:id])
    @followers = @user.followers
    render 'myfollower'
  end

  def mytag
    @clips = @user.clips
    @tags = @clips.all_tags
  end
end
