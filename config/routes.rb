Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  # ここにusersコントローラーのshowアクションのルーティングを追加する
  get '/users/:id', to: 'users#show', as: 'user'
end
