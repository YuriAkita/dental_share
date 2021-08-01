Rails.application.routes.draw do
  get 'reviews/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: 'top#index'
  resources :users, only: [:show]
  resources :bookmarks, only: %i[create destroy show]
  resources :likes, only: %i[create destroy show]

  resources :reviews do
    resources :comments
  end

  resources :blogs do
    resources :comments
  end

end
