class RecipesController < ApplicationController
  before_action :user_role_create, except: [:index, :show]

  def index
    if params[:genre_id]
      @recipes = Recipe.where(genre_id: params[:genre_id], is_valid: true).page(params[:page]).per(5)
    else
      @q = Recipe.ransack(params[:q])
      @recipes = @q.result(distinct: true, is_valid: true).order(created_at: :desc).page(params[:page]).per(5)
      #is_valid: trueだけ表示したい
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @cooks = @recipe.cooks
    @mterials = @recipe.mterials
    @comment = Comment.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    unless @recipe.user_id == current_user.id
      redirect_to recipe_path(@recipe)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe), notice: "レシピを編集しました!"
    else
      render :edit
    end
  end

  def new
    @recipe = Recipe.new
    @cook = @recipe.cooks.build
    @mterial = @recipe.mterials.build
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to homes_shelf_path, notice: "レシピを削除しました"
    else
      render :show
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "レシピを保存しました!"
    else
      render :new
    end
  end


  private
  def recipe_params
    params.require(:recipe).permit(:name, :image, :amount, :explanation, :is_valid, :genre_id, mterials_attributes: [:id, :name, :puantity, :_destroy],cooks_attributes: [:id, :image, :body, :_destroy])
  end
end
