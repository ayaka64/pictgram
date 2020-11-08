# ルーティングの設定
Rails.application.routes.draw do
  
  get 'sessions/new'
  
  root 'pages#index'
  get 'pages/help'
  
  get    '/login',   to: 'sessions#new' 
  # ログインするためのフォームを表示するページの取得
  
  post   '/login',   to: 'sessions#create'
  # ログイン時に新しいアドレスやパスワードを送信してもらい、Sessionの作成する
  
  delete '/logout',   to: 'sessions#destroy'
  # ログアウト時にSessionを削除する
  
  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  
  delete '/favorites', to: 'favorites#destroy'
  
  resources :comments
  
  get 'comments/new'
  post '/comments', to: 'comments#create'
  
  
end
