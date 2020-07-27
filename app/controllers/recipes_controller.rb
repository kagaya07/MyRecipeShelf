class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
    @mterials = @recipe.mterials.order(created_at: :asc)
  end

  def edit
  end

  def update
  end

  def new
    @recipe = Recipe.new
  end

  def destroy
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save!
      redirect_to recipe_path(@recipe), notice: "レシピを保存しました!"
    else
      render :new
    end
  end


  private
  def recipe_params
    params.require(:recipe).permit(:name, :image, :amount, :explanation, :is_valid, :genre_id, cooks_attributes: [:id, :image, :body, :_destroy], mterials_attributes: [:id, :name, :puantity, :_destroy])
  end
end
