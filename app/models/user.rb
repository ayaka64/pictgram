
# ユーザーデータ条件を決定する

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true
  
  has_secure_password
  
  validates :password, presence: true, length: { minimum: 8, maximum: 32 }, 
  format: {with: VALID_PASSWRD_REGEX }
    
  VALID_PASSWRD_REGEX =/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  
end
