class ClipsController < ApplicationController

  def index
  end

  def new
    @clip = Clip.new
  end

  def create
    @clip = current_user.clips.new(clip_params)
    if @clip.save
      redirect_to clip_path(@clip)
    else
      flash[:alert] = '投稿できませんでした'
      render :new
    end
  end

  def show
    @clip = Clip.find(params[:id])
    #このユーザの人気の部屋写真を表示するため
    @clips_like = Clip.where(user_id: @clip.user).order("likes_count DESC").limit(12)
    #関連するインテリア実例を表示するため（タグ機能実装後、記述内容変更予定）
    @clips_tag = Clip.order("likes_count DESC").limit(12)
    #このインテリアが撮影された日の人気写真を表示するため
    @clips_day =  Clip.where(created_at: @clip.created_at.all_day).order("likes_count DESC").limit(12)
  end

  def destroy
    clip = Clip.find(params[:id])
    clip.destroy
    #自分の投稿したデータのうち、削除したデータの次に小さいIDを表示
    #一番小さいIDを削除使用とした時、次に小さいIDは無いので、その時はマイルームへ遷移
      if clip.previous.blank?
        redirect_to user_path(clip.user.id)
      else
        redirect_to clip_path(clip.previous)
      end
  end

  private

  def clip_params
    params.required(:clip).permit(:image)
  end

end
