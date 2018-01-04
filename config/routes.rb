Rails.application.routes.draw do
  resources :resolutions
  devise_for :users do
    member do
      get 'users#dashboard'
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'users#dashboard', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :users, only: [:show, :edit, :update]
end
