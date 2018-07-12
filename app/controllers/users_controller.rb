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
  end

  def follow
    @user  = User.find(params[:id])
    @users = @user.follows
    render 'show_follow_all'
  end

  def follower
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower_all'
  end

  def mytag
    @clips = @user.clips
    @tags = @clips.all_tags
  end
end
