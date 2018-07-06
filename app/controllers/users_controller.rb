class UsersController < ApplicationController
  before_action :set_user, only: [:show, :photo_list]

  def set_user
    @user = User.find(params[:id])
  end

end
