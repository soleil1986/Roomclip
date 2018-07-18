class LikesController < ApplicationController
  def create
    @clip = Clip.find(params[:clip_id])
    @like = Like.create(user_id: current_user.id, clip_id: @clip.id)
    @clip.reload
  end

  def destroy
    @clip = Clip.find(params[:clip_id])
    like = current_user.likes.find_by(user_id: current_user.id, clip_id: @clip.id)
    like.destroy
    @clip.reload
  end

end


