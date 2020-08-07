class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :authenticate_user!, except: [:top]

 protected

 def user_role
 	if current_user.role != "admin"
 		redirect_to homes_home_path
 	end
 end

 def user_role_create
 	if current_user.role == "sub_customer"
 		flash[:notice] = '新規登録が必要です'
 		redirect_to homes_home_path
 	end
 end

 def after_sign_in_path_for(reosuce)
 	flash[:notice] = 'ログインしました！！'
 	homes_home_path
 end

 def after_sign_up_path_for(reosuce)
 	flash[:notice] = 'ログインしました！！'
 	homes_home_path
 end

 def after_sign_out_path_for(reosuce)
 	flash[:notice] = 'ログアウトしました。'
 	root_path
 end

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :role])
   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
 end
end
