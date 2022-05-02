Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: "user_sessions#create"
  post 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :questions do
    resources :choices, only: %i[new create edit update destroy], shallow: true
  end
end
