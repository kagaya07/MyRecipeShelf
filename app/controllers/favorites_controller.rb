class FavoritesController < ApplicationController
  before_action :recipes

  def create
    favorite = Favorite.new
    favorite.recipe_id = @recipe.id
    favorite.user_id = current_user.id
    favorite.save
  end

  def destroy
    favorite = Favorite.find_by( user_id: current_user.id, recipe_id: @recipe.id)
    favorite.destroy
  end

  def recipes
    @recipe = Recipe.find(params[:recipe_id])
  end
end
