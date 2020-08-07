class GenresController < ApplicationController
  before_action :user_role

  def index
    @genres = Genre.all

  	if params[:id].present?
      @genre = Genre.find(params[:id])
    else
      @genre = Genre.new
    end
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
