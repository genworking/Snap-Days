Rails.application.routes.draw do

  devise_for :users,controllers: {
    registrations: 'registrations'
    }

  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'legal/terms'
  get 'legal/privacy'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'mypassword/:name' => 'users#mypassword', as: 'user_mypassword'
  get 'unsubscribe/:name' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  delete 'unsubscribe/:name' => 'users#destroy', as: 'user_destroy'

  resources :users
  
  # リンク先name指定
  resources :users, param: :name

  # フォロー、フォロワー
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]

  # 投稿
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end
