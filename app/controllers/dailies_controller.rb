class DailiesController < ApplicationController

# show以外は管理者側の登録・変更・削除機能
# showはユーザーの確認画面
  def new
    @daily = Daily.new
  end

  def create
    @daily = Daily.create
    redirect_to edit_daily_path(@daily)
  end

  def show
    @daily = Daily.find(params[:id])
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
    params.required(:daily).permit(:date)

  end

end
