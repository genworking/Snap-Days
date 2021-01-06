Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }

  root 'posts#index'

  get '/users/:id', to: 'users#show', as: 'user'

  # この行を編集する
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
  end
end
