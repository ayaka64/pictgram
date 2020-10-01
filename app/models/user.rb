
# ユーザーデータ条件を決定する

class User < ApplicationRecord
  # 名前を15文字まで許可を追加
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  
  # アルファベット、数字の混合のみ可能
  VALID_PASSWRD_REGEX =/\A(?=.*?[a-z])[a-z\d]{ 8, 32 }+\z/
  
  # ~ @ ~ . ~の形を許可
  VALID_PASSWRD_REGEX =/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  
  # パスワードの文字数制限
  validates :password, presence: true, length: { minimum: 8, maximum: 32 }, 
  format: {with: VALID_PASSWRD_REGEX }
  
  has_secure_password
  
end
