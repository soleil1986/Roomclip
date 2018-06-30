class LikesController < ApplicationController
  def create
    @clip = Clip.find(params[:clip_id])
    like = current_user.likes.build(clip_id: @clip.id)
    like.save
    @clip.reload
  end

  def destroy
    @clip = Clip.find(params[:clip_id])
    like = current_user.likes.find_by(clip_id: @clip.id)
    like.destroy
    @clip.reload
  end
end
