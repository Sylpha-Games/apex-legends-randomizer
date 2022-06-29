class AmmosController < ApplicationController
  
  def index
    @ammos = Ammo.order(id: :asc)
  end
  
  def show
    @ammo = Ammo.find(params[:id])
    @weapons = Weapon.where(ammo_id: @ammo.id).order(id: :asc)
  end
  
  def random
    rand = Rails.env.production? ? "RANDOM()" : "rand()"
    @weapon_1 = Weapon.order(rand).first
    @ammo_1 = @weapon_1.ammo
    session[:ammo_1_id] = @ammo_1.id
    @weapon_2 = Weapon.where.not(ammo_id: @ammo_1.id).order(rand).first
    @ammo_2 = @weapon_2.ammo
    session[:ammo_2_id] = @ammo_2.id
    redirect_to root_url
  end
  
  def random_destroy
    session[:ammo_1_id] = nil
    session[:ammo_2_id] = nil
    redirect_to root_url
  end
  
end
