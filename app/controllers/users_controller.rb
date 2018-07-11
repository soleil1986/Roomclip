class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
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

end
