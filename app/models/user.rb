
# ユーザーデータ条件を決定する

class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true,
  
  has_secure_password
  
end
