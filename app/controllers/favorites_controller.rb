class FavoritesController < ApplicationController
  before_filter :load_service

  def create
    @favorite = current_user.favorites.build
    @favorite.service = @service
    @favorite.save
    redirect_to service_path(@service)
  end

  def destroy
    @favorite = current_user.favorites.find_by_id(params[:id])
    @favorite.destroy
    redirect_to service_path(@service)
  end

  private
  def load_service
    @service = Service.find(params[:service_id])
  end
end
