class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    @user = current_user
    @fluxes = @user.fluxes
    @flux = Flux.new
  end

end
