class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def follow
      @user  = User.find(params[:id])
      @users = @user.follows
  end

  def follower
    @user  = User.find(params[:id])
    @users = @user.followers
  end
end
