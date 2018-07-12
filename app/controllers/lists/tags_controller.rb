class Lists::TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag
    @tags = Clip.all_tags
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:name])
    @clips = Clip.tagged_with(params[:name])
  end
end
