class ClipsController < ApplicationController
  def index

  end

  def new
    @clip = Clip.new
  end

  def create
    @clip = Clip.create(clip_params)
    redirect_to new_clip_path
  end

  def show
    @clip = Clip.find(params[:id])
  end

  def destroy
  end

  private

  def clip_params
    params.required(:clip).permit(:image)
  end

end
