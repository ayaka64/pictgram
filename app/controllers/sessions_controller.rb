class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    # フォームに入力されたアドレスが一致するユーザーがいるか検索
    if user && user.authenticate(params[:session][:password])
      # userのパスワードが正しいか確認
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
    # [:user_id]にログイン情報を保存
  end
  
end


