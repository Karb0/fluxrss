class FluxesController < ApplicationController

  def show
    @flux = Flux.find(params[:id])
  end

  def new
    @flux = Flux.new
  end

  def create
     @flux = current_user.fluxes.build(flux_params)
    if @flux.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def flux_params
    params.require(:flux).permit(:url)
  end

end
