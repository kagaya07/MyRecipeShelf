class FavoritesController < ApplicationController

  def create
  	@recipe = Recipe.find(params[:recipe_id])
    favorite = Favorite.new
    favorite.recipe_id = @recipe.id
    favorite.user_id = current_user.id
    favorite.save
  end

  def destroy
  	@recipe = Recipe.find(params[:recipe_id])
    favorite = Favorite.find_by( user_id: current_user.id, recipe_id: @recipe.id)
    favorite.destroy
  end
end
