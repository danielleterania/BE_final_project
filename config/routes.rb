Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'home#index' 

  namespace :admin do
    root to: 'dashboard#index'
    resources :user_approvals, only: [:index] do
      member do
        patch :approve
      end
    end
    resources :complaints, only: [:index] do
      member do
        patch :respond
      end
    end
    resources :announcements, only: [:index, :create, :destroy]
    resources :form_approvals, only: [:index] do
      member do
        patch :approve
      end
    end
    resource :about_us, only: [:edit, :update]
  end
  
  resources :homeowners, only: [:index]
end
