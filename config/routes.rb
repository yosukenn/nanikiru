Rails.application.routes.draw do
  devise_for :users
  root to: 'coordinates#index'

  defaults format: :json do
    resources :coordinates, only: [:index]
  end
end
