class BattleRecordsController < ApplicationController
  
  before_action :require_user_login
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    @battle_records = BattleRecord.where(user_id: session[:user_id]).order(id: :desc).page(params[:page]).per(50)
  end
  
  def new
    @battle_record = BattleRecord.new
    @legend = Legend.find(params[:legend_id])
    @weapon = Weapon.find(params[:weapon_id])
    @stages = Stage.order(id: :asc)
  end
  
  def create
    @battle_record = BattleRecord.new(battle_record_create_params)
    @battle_record.user_id = session[:user_id]
    @battle_record.legend_id = params[:legend_id]
    @battle_record.weapon_id = params[:weapon_id]
    if @battle_record.save
      msg = "レジェンド：#{@battle_record.legend.name},武器：#{@battle_record.weapon.name},ステージ：#{@battle_record.stage.name},ダメージ：#{@battle_record.damage}"
      msg = msg.gsub(",","<br>")
      flash[:success] = msg
    else
      flash[:danger] = '登録に失敗しました。'
    end
    redirect_to root_url
  end
  
  def edit
    @legends = Legend.order(id: :asc)
    @weapons = Weapon.order(id: :asc)
    @stages = Stage.order(id: :asc)
  end
  
  def update
    if @battle_record.update(battle_record_update_params)
      flash[:success] = '更新しました。'
      redirect_to battle_records_path
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end
  
  def destroy
    @battle_record.destroy
    flash[:success] = "削除しました"
    redirect_to battle_records_path
  end
  
  private
  
  def battle_record_create_params
    params.require(:battle_record).permit(:stage_id, :damage)
  end
  
  def battle_record_update_params
    params.require(:battle_record).permit(:legend_id, :weapon_id, :stage_id, :damage)
  end
  
  def ensure_correct_user
    @battle_record = BattleRecord.find(params[:id])
    if @battle_record.user_id != current_user.id
      flash[:danger] = "権限がありません"
      redirect_to root_url
    end
  end
  
end
