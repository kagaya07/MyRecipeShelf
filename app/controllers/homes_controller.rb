class HomesController < ApplicationController
 before_action :user_role_create, except: [:top, :home]

 def top
 end

 def home
 	@genres = Genre.all
 	@recipes = Recipe.where(is_valid: true).order(created_at: :desc).limit(4)
 	# ランキング用に取得した情報をいれるcreate_ranksはクラスメソッド
 	@recipes_rank = Recipe.create_ranks
 end

 def shelf
 	#shelfページから持ってきたvalueの値で条件分岐
 	if params[:option] == "1"
 		@recipes = current_user.recipes.order(:name).page(params[:page]).per(16) #料理名順
 	elsif params[:option] == "2"
 		@recipes = current_user.recipes.order(:genre_id).page(params[:page]).per(16) #ジャンルidで並べる
 	elsif params[:option] == "3"
 		@recipes = current_user.recipes.page(params[:page]).per(16) #レシピ古い順
 	else
 		@recipes = current_user.recipes.order(created_at: :desc).page(params[:page]).per(16) #レシピ新しい順
 	end
 end

 def like_shelf
 	if params[:option] == "1"
 		@favorites = current_user.favorites.order(:genre_id).page(params[:page]).per(16)
 	elsif params[:option] == "2"
 		@favorites = current_user.favorites.page(params[:page]).per(16)
 	else
 		@favorites = current_user.favorites.order(created_at: :desc).page(params[:page]).per(16)
 	end
 end
end


