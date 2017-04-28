
Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  post '/bartenders/search', to: 'bartenders#search'

  get '/bartenders/search', to: 'bartenders#search'
  resources :bartenders, only: [:index, :show] do
    resources :reviews, only: [:new, :create, :update]
    resources :parties, only: [:show, :create]
  end

end
