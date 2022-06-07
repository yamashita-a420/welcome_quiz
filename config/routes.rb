Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: "user_sessions#create"
  post 'logout', to: 'user_sessions#destroy'
  get 'result', to: 'messages#new'
  post 'result', to: 'messages#create'
  get 'messages', to: 'messages#index'

  resources :users, only: %i[new create]
  resources :questions do
    resources :choices, only: %i[new create edit update destroy], shallow: true
  end
  resources :quizzes, only: %i[index]
  resource :first_question, only: %i[show]
  resource :second_question, only: %i[show]
  resource :third_question, only: %i[show]
  resource :mypage, only: %i[show edit update]
end
