class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  add_flash_types :success, :info, :warning, :danger
  
  helper_method :current_user, :logged_in? # ★課題
  
  def current_user # 現在ログインしているユーザーを返す
    @current_user ||= User.find_by(id:session[:user_id])
  end
  
  def logged_in? # ログインしているかどうかの確認メソッド
    !current_user.nil?
  end
  
end
