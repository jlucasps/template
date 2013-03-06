class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new(params.extract!(:list_id))
    @favorite.user = current_user
    @favorite.save
    respond_with @favorite.user, @favorite.list, @favorite
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_with @favorite
  end
end
