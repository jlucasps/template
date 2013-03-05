class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.create(params.extract!(:user_id, :list_id))
    respond_with @favorite.user, @favorite.list, @favorite
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    respond_with @favorite
  end
end
