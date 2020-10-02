# ユーザー情報の登録
class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました' # 指定のrootのurlに転送する
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
    end
  end
  
  private # クラス外部から呼び出せないようにする
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end