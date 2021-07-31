Rails.application.routes.draw do
  get 'reviews/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  root to: 'top#index'
  resources :users, only: [:show]
  resources :reviews 
  resources :blogs

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
