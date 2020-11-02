# userモデルを扱う、userデータ条件を決定する

class User < ApplicationRecord
  # 名前を15文字まで許可を追加
  validates :name, presence: true, length: { maximum: 15 }

  # ~ @ ~ . ~の形を許可
  VALID_EMAIL_REGEX = /\A\S+@\S+\.\S+\z/
  # /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/
  # /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  
  # アルファベット、数字の混合のみ可能
  VALID_PASSWRD_REGEX =/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/
  # /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/i
  
  # パスワードの文字数制限
  validates :password, presence: true, length: { minimum: 8, maximum: 32 }, format: { with: VALID_PASSWRD_REGEX }
  # minimum: 8, maximum: 32
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  
end
