Rails.application.routes.draw do
  devise_for :users
  root to: 'coordinates#index'
  get '/about', to: 'coordinates#index'
  get '/mycoorde', to: 'coordinates#index'

  defaults format: :json do
    resources :coordinates, only: [:index, :create]
  end
end
