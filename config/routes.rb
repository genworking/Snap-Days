Rails.application.routes.draw do
  get 'legal/terms'
  get 'legal/privacy'
  devise_for :users,controllers: {
    registrations: 'registrations'
    }

  root 'posts#index'
  get '/users/:id', to: 'users#show', as: 'user'
  get 'legal/terms'
  get 'legal/terms', to: 'users#terms'
  get 'legal/privacy' => 'legal#privacy'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'mypassword/:name' => 'users#mypassword', as: 'user_mypassword'
  get 'unsubscribe/:name' => 'users#unsubscribe', as: 'confirm_unsubscribe'

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
