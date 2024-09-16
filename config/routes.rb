Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'home#index'

  namespace :admin do
    root to: 'dashboard#index'
    
    resources :user_approvals, only: [:index] do
      member do
        patch :approve
        patch :pending
      end
    end
    
    resources :complaints, only: [:index] do
      member do
        patch :respond
      end
    end
    
    resources :announcements, only: [:index, :create, :destroy]
    
    resources :form_approvals, only: [:index, :new, :create, :edit, :update, :show] 

    resources :form_responses, only: [:index, :show] do
      member do
        get :approve
        get :deny
      end
    end
    
    resource :about_us, only: [:edit, :update]
  end

  namespace :users do
    root to: 'dashboard#index'
    
    resources :forms, only: [:index, :show, :create] do
      resources :form_responses, only: [:index]
    end
    resources :announcements, only: [:index]
    resource :about_us, only: [:show]
    resource :bylaws, only: [:show]
    resources :complaints, only: [:create, :index]
  end

  resource :profile, only: [:show] 
  resources :homeowners, only: [:index]
end
