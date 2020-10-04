module ApplicationHelper
  def current_user # 現在ログインしているユーザーを返す
    @current_user ||= User.find_by(id:session[:user_id])
  end
  
  def logged_in? # ログインしているかどうかの確認メソッド
    !current_user.nil?
  end
  
end
