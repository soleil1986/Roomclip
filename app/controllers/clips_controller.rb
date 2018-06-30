class ClipsController < ApplicationController
  def index
  end

  def new
    @clip = Clip.new
  end

  def create
    clip = current_user.clips.create(clip_params)
    redirect_to new_clip_path
  end

  def show
    @clip = Clip.find(params[:id])
  end

  def destroy
    clip = Clip.find(params[:id])
    clip.destroy
    redirect_to new_clip_path
  end

  private

  def clip_params
    params.required(:clip).permit(:image, :tag_list)
  end

end
