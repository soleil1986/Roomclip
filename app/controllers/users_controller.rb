class UsersController < ApplicationController
  before_action :set_user, only: [:show, :photo_list]

  def set_user
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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

end
