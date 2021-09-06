Rails.application.routes.draw do
  resources :topics
  resources :answers
  resources :questions

  get 'follow/follow'
  get 'following', to: "follow#following"
  get 'follower', to: "follow#follower"
  get 'home/my_questions'
  
  devise_for :users
  
  root to: "home#index"
end
