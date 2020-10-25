class SessionsController < ApplicationController
  def new
  end
  
  def create
    
    user = User.find_by(email: email_params[:email])  # ★課題
    # フォームに入力されたアドレスが一致するユーザーがいるか検索
   
    if user && user.authenticate(password_params[:password])  # ★課題
      # userのパスワードが正しいか確認
      log_in user
      redirect_to root_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
    # [:user_id]にログイン情報を保存
  end
  
  def log_out
    session.delete(:user_id)
    # セッションに保存されているuser_idを削除＝ログアウト
    @current_user = nil
    # ユーザー情報の削除
  end
  
  def email_params  # ★課題
    params.require(:session).permit(:email)
  end
  
  def password_params  # ★課題
    params.require(:session).permit(:password)
  end
end


