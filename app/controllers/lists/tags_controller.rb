class Lists::TagsController < ApplicationController

  def index
    @tags = ActsAsTaggableOn::Tag
    @tags = Clip.all_tags
  end

  def show
    @clip = Clip.tagged_with(params[:tag_name])
  end
end
