class WeaponsController < ApplicationController
  
  def index
    @weapons = Weapon.order(id: :asc)
  end
  
  def show
    @weapon = Weapon.find(params[:id])
  end
  
  def random
    rand = Rails.env.production? ? "RANDOM()" : "rand()"
    @weapon = Weapon.order(rand).first
    session[:weapon_id] = @weapon.id
    redirect_to root_url
  end
  
  def random_destroy
    session[:weapon_id] = nil
    redirect_to root_url
  end
  
end
