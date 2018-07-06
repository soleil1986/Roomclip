class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def photo_list
    @user = User.find(params[:id])
  end

end
