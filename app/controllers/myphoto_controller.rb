class MyphotoController < ApplicationController

  def show
    @user = User.find(params[:id])
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    @clips = @user.clips.tagged_with(params[:name])
  end

  private

  def myphoto_params
    myphoto_params.required(:tag).permit(:name)
  end

end
