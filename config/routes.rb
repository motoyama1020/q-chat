Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end 
  root to: "rooms#index"
  resources :users
  resources :rooms do
    resources :messages
    collection do
      get 'search'
    end
  end
end
