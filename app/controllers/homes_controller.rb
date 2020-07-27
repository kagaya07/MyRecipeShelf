class HomesController < ApplicationController
 def top
 end

 def home
 	@recipe = Recipe.all
 end

 def shelf
    @recipes = current_user.recipes
  end
end
