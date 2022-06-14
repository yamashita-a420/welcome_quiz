Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: "user_sessions#create"
  delete 'logout', to: 'user_sessions#destroy'
  post 'result', to: 'messages#create'
  get 'messages', to: 'messages#index'
  delete 'message', to: 'messages#destroy'

  resources :users, only: %i[new create] do
    resources :quizzes, only: %i[index]
    resources :first_questions, only: %i[show]
    resources :second_questions, only: %i[show]
    resources :third_questions, only: %i[show]
    get 'result', to: 'messages#new'
    get 'result/message_sent', to: 'messages#show'
  end
  resources :questions do
    resources :choices, only: %i[new create edit update destroy], shallow: true
  end
  resource :mypage, only: %i[show edit update]
end
