class HomesController < ApplicationController
 def top
 end

 def home
 	@genres = Genre.all
 	@recipes = Recipe.all.order(created_at: :desc).limit(4)
 	# ランキング用に取得した情報をいれるcreate_ranksはクラスメソッド
 	@recipes_rank = Recipe.create_ranks
 end

 def shelf
    @recipes = current_user.recipes
 end

 def like_shelf
 	@favorites = current_user.favorites
 end
end
