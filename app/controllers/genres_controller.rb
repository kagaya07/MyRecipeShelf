class GenresController < ApplicationController
  def index
  	@genre = Genre.new
  	@genres = Genre.all
  end

  def edit
  	@genre = Genre.find(params[:id])
  end

  def update
  	@genre = Genre.find(params[:id])
  	if @genre.update(genre_params)
  		redirect_to genres_path
  	else
  		render :show
  	end
  end

  def create
  	@genre = Genre.new(genre_params)
  	if @genre.save
  		redirect_to genres_path
  	else
  		render :index
  	end
  end

  private

  def genre_params
  	params.require(:genre).permit(:name, :is_vaild)
  end
end