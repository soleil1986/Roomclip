class MyphotoController < ApplicationController

  def show
    # @myphoto = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    # @clips = Clip.tagged_with(params[:name])
    # @users = User.find(user_params)
  end

  private

  def myphoto_params
    params.required(:tag).permit(:name)
  end

  # def user_params
  #   params.require(:user).permit(:name)
  # end
end
