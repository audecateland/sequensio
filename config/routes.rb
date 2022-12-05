Rails.application.routes.draw do
  devise_for :users
  root to: "music_sessions#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  post "/music_sessions/:id/duplicate", to: "music_sessions#duplicate", as: :duplicate_music_session

  resources :music_sessions, only: [:new, :create, :destroy, :index, :show, :edit, :update] do
    resources :sequences, only: [:edit, :update, :new, :create, :shuffle]
  end
  resources :tracks, only: [:update, :index]
end
