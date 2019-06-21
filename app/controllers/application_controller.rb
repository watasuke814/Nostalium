class ApplicationController < ActionController::Base
  before_action :set_current_user
  
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user == nil
      flash[:error] = "ログインしていません"
      redirect_to root_path
    end
  end

  def forbid_login_user
    if @current_user
      flash[:error] = "ログイン済みです"
      redirect_to posts_path
    end
  end
end
