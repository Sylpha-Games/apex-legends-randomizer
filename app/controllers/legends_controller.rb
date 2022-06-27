class LegendsController < ApplicationController
  
  def index
    @legends = Legend.order(id: :asc)
  end
  
  def show
    @legend = Legend.find(params[:id])
  end
  
  def random
    rand = Rails.env.production? ? "RANDOM()" : "rand()"
    @legend = Legend.order(rand).first
    session[:legend_id] = @legend.id
    redirect_to root_url
  end
  
  def random_destroy
    session[:legend_id] = nil
    redirect_to root_url
  end
  
end
