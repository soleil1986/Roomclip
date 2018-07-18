class FoldersController < ApplicationController
  def new
    @folder = Folder.find(params[:folder_id])
    @clip = Clip.find(params[:clip_id])
  end

  def create
    @clip = Clip.find(params[:clip_id])
    @like = Like.create(user_id: current_user.id, clip_id: @clip.id)
    @clip.reload
  end

  def destroy
    @clip = Clip.find(params[:clip_id])
    @folder = Folder.find(params[:folder_id])
    folder = current_user.folder_clips.find_by(folder_id: @folder.id, clip_id: @clip.id)
    folder.destroy
    @clip.reload
  end

end
