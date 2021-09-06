Rails.application.routes.draw do
  resources :topics
  resources :answers
  resources :questions
  get 'follow/follow'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'home/my_questions'
  devise_for :users
  
  root to: "home#index"
end
