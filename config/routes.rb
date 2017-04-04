Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :sessions
  delete '/logout' => 'sessions#destroy', as: :logout

  resources :categories
  resources :tplays
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :back do
    root 'sessions#new'
    resources :sessions
    resources :tplays do
      resources :tplay_images
    end
    resources :categories

  end


end
