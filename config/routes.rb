Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'home#index' 
  
  namespace :admin do
    root to: 'dashboard#index'
  end
  resources :homeowners, only: [:index]
end
