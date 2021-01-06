Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }

  root 'pages#home'

  get '/users/:id', to: 'users#show', as: 'user'

  # ==========ここから編集する==========
  resources :posts, only: %i(new create) do
    resources :photos, only: %i(create)
  end
  # ==========ここまで編集する==========

end
