class ToppagesController < ApplicationController
  
  before_action :require_user_login, only: [:achievement]
  
  def index
    if session[:legend_id]
      @legend = Legend.find_by(id: session[:legend_id])
    end
    if session[:weapon_id]
      @weapon = Weapon.find_by(id: session[:weapon_id])
    end
    if session[:ammo_1_id]
      @ammo_1 = Ammo.find_by(id: session[:ammo_1_id])
    end
    if session[:ammo_2_id]
      @ammo_2 = Ammo.find_by(id: session[:ammo_2_id])
    end
  end
  
end
