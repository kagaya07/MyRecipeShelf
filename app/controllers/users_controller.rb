class UsersController < ApplicationController
  before_action :user_role_create
  before_action :user_role, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recipes = @user.recipes.order(created_at: :desc).limit(5)
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      render :show
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:image,:specialties)
  end
end
