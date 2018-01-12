Rails.application.routes.draw do
  resources :resolutions do
    member do
      get 'make_complete', to: 'resolutions#make_complete', as: :complete
      get 'make_active', to: 'resolutions#make_active', as: :activate
      get 'make_on_hold', to: 'resolutions#make_on_hold', as: :store
    end
  end

  resources :goals do
    member do
      get 'make_complete', to: 'goals#make_complete', as: :complete
      get 'make_active', to: 'goals#make_active', as: :activate
      get 'make_on_hold', to: 'goals#make_on_hold', as: :store
    end
  end

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
