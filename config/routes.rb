Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: "user_sessions#create"
  delete 'logout', to: 'user_sessions#destroy'
  get 'messages', to: 'messages#index'
  delete 'message', to: 'messages#destroy'
  get 'qrcode', to: 'qrcodes#show'

  resources :users, only: %i[new create destroy] do
    resources :quizzes, only: %i[index]
    resources :take_quizzes, only: %i[index]
    post 'first_question', to: 'first_questions#show'
    post 'second_question', to: 'second_questions#show'
    post 'third_question', to: 'third_questions#show'
    post 'result', to: 'messages#new'
    post 'result_message', to: 'messages#create'
    get 'result_message_sent', to: 'messages#show'
  end
  resources :questions do
    resources :choices, only: %i[new create edit update destroy], shallow: true
  end
  resource :mypage, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
  namespace :admin do
    root 'dashboards#index'
  end
end
