Rails.application.routes.draw do
  # config/routes.rb

  devise_for :users

  resources :movies do
    get 'search', on: :collection
    post 'add_to_favorites', on: :member
  end

  resources :favorites do
    get 'remove_from_favorites', on: :member
  end

  # root 'movies#index'
  
  authenticated :user do
    root 'movies#index', as: :authenticated_root
  end
  
  unauthenticated do
    root 'movies#index'
  end
end
