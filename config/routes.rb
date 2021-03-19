Rails.application.routes.draw do
  get 'search/search'
  devise_for :users,controllers: {
    registrations: 'registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
    }

  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'legal/terms'
  get 'legal/privacy'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'unsubscribe/:name' => 'users#unsubscribe', as: 'confirm_unsubscribe'
  get 'search', to: 'search#search', as: 'search'
  get '/post/hashtag/:name' => 'posts#hashtag'
  get '/post/hashtag' => 'posts#hashtag'
  delete 'unsubscribe/:name' => 'users#destroy', as: 'user_destroy'

  resources :users

  # リンク先name指定
  resources :users, param: :name

  # パスワード変更用
  resource :account, :only => [:show] do
        resource :password, :only => [:edit, :update], module: "accounts"
  end

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

  resources :notifications, only: :index

  # お気に入り
  resources :users, only: [:show, :edit, :update] do
    get :favorites, on: :collection
  end

  # お気に入り
  resources :posts, expect: [:index] do
    resource :favorites, only: [:create, :destroy]
  end
end
