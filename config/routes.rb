Rails.application.routes.draw do
  get 'review_comments/create'
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
    resources :review_comments
  end

  resources :blogs do
    resources :blog_comments
  end

end
