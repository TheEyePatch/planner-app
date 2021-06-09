Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do 
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root to: 'devise/sessions#new'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root to: 'home#index'
  resources :categories do 
    resources :tasks
  end
end
