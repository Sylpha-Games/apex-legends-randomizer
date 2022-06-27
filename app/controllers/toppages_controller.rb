class ToppagesController < ApplicationController
  
  before_action :require_user_login, only: [:achievement]
  
  def index
    if session[:legend_id]
      @legend = Legend.find_by(id: session[:legend_id])
    end
    if session[:weapon_id]
      @weapon = Weapon.find_by(id: session[:weapon_id])
    end
  end
  
end
