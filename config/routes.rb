Rails.application.routes.draw do
  get 'review_comments/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: 'users/passwords'
  }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: 'top#index'

  resources :users, only: [:show]
  resources :bookmarks, only: %i[create destroy index]
  resources :likes, only: %i[create destroy index]

  resources :reviews do
    resources :review_comments, except: %i[index new show]
  end

  resources :blogs do
    resources :blog_comments, except: %i[index new show]
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

end
