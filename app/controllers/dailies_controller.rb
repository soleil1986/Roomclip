class DailiesController < ApplicationController

# show以外は管理者側の登録・変更・削除機能
# showはユーザーの確認画面
  def new
    @daily = Daily.new
    @daily.dailyclips.build
  end

  def create
    @daily = Daily.create(daily_params)
    redirect_to edit_daily_path(@daily)
  end

  def show
    @daily = Daily.find(params[:id])
    @dailyclips = @daily.dailyclips
    @clip = @dailyclips.pluck(:clip_id)
    @dailyphoto = Clip.where(id: @clip)
    # @dailyでdaily_idを定義
    # @dailyclipsでdailyclipsテーブルから@dailyで定義したidのデータを定義
    # @clipで@dailyclipsで定義したデータの中からclip_idだけを定義
    # @dailyphoyoでclipsテーブルから@clipで定義したclip_idのclipデータを定義。この時、id=@clipではなくid: @clipとシンボル型にしデータ取得
  end

  def edit
    @daily = Daily.find(params[:id])
  end

  def update
    @daily = Daily.find(params[:id])
  end

  def destroy
    daily = Daily.find(params[:id])
    daily.destroy
    redirect_to new_daily_path(@daily)
  end

private

  def daily_params
    params.required(:daily).permit(:date, dailyclips_attributes: [:id, :daily_id, :num, :clip_id])

  end

end
