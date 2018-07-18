class ClipsController < ApplicationController

  def index
      @daily_today = Daily.order(date: :DESC).first
      @daily_yesterday = Daily.order(date: :DESC).second
      @daily_3daysago = Daily.order(date: :DESC).third
      @daily_4daysago = Daily.order(date: :DESC).fourth

    if @daily_today.blank?
      render "dailies/new" and return
    else
      @dailyclips_t = @daily_today.dailyclips
      @clip_t = @dailyclips_t.pluck(:clip_id)
      @dailyphoto_t = Clip.where(id: @clip_t)
    end

    if @daily_yesterday.blank?
      render "dailies/new" and return
    else
      @dailyclips_y = @daily_yesterday.dailyclips
      @clip_y = @dailyclips_y.pluck(:clip_id)
      @dailyphoto_y = Clip.where(id: @clip_y)
    end

    if @daily_3daysago.blank?
      render "dailies/new" and return
    else
      @dailyclips_3 = @daily_3daysago.dailyclips
      @clip_3 = @dailyclips_3.pluck(:clip_id)
      @dailyphoto_3 = Clip.where(id: @clip_3)
    end

    if @daily_4daysago.blank?
      render "dailies/new" and return
    else
      @dailyclips_4 = @daily_4daysago.dailyclips
      @clip_4 = @dailyclips_4.pluck(:clip_id)
      @dailyphoto_4 = Clip.where(id: @clip_4)
    end
  end

  def new
    if user_signed_in?
      @clip = Clip.new
    else
      redirect_to new_user_registration_path, alert: 'ご利用には無料登録が必要です。'
    end
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
    @clips_like = Clip.user_clip(@clip.user).popular_clip.displaynum_clip
    #関連するインテリア実例を表示するため（タグ機能実装後、記述内容変更予定）
    @clips_tag = Clip.popular_clip.displaynum_clip
    #このインテリアが撮影された日の人気写真を表示するため
    @clips_day =  Clip.dayly_clip(@clip.created_at.all_day).popular_clip.displaynum_clip
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
    params.required(:clip).permit(:image, :tag_list)
  end

end
