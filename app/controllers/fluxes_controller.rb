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

  def destroy
    flux = Flux.find(params[:id])
    destroy_articles(flux)
    flux.destroy
    redirect_to root_path
  end

  private
  
  def flux_params
    params.require(:flux).permit(:url)
  end

  def destroy_articles(flux)
    flux.articles.each do |article|
      article.destroy
    end
  end

end
