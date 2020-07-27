class TestsessionsController < ApplicationController
  def create
  	user = User.find_by(email:"sub@account.com")
  	session[:user_id] = 1
  	flash[:notice] = "かんたんログインしました！"
  	redirect_to homes_home_path
  end

end
