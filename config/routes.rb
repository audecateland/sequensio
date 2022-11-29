Rails.application.routes.draw do
  devise_for :users
  root to: "sessions#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :sessions, only: [:new, :create, :destroy, :index, :show, :duplicate, :edit, :update] do
    resources :sequences, only: [:edit, :update, :create, :shuffle]
  end

  resources :tracks, only: [:update, :index]
end
