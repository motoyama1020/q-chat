Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users
  resources :rooms do
    resources :messages
    collection do
      get 'search'
    end
  end
end
