Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  root to: "music_sessions#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post "/music_sessions/:id/duplicate", to: "music_sessions#duplicate", as: :duplicate_music_session
  get "/tracks/shuffle", to: "sequences#shuffle", as: :shuffle_track

  resources :music_sessions, only: [:new, :create, :destroy, :index, :show, :edit, :update] do
    resources :sequences, only: [:edit, :update, :new, :create]
  end
  resources :sequences, only: [:destroy] do
    get "/tracks/:id/shuffle", to: "sequences#shuffle_one", as: :shuffle_a_track
  end
  resources :tracks, only: [:update, :index]
end
