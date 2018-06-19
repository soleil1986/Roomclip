class ClipsController < ApplicationController

  def new
    @clip = Clip.new
  end

  def create
    @clip = Clip.new(clip_params)
  end

  def show
    @clip = Clip.find(params[:id])
  end

  def destroy
  end

  private

  def clip_params
    params.require(:clip).permit(
      :image
    )
  end

end
