Rails.application.routes.draw do
  get 'review_comments/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: 'users/passwords',
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root to: 'top#index'

  resources :users, only: %i[show index] do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end

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
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  namespace :admin do
    resources :users
  end

end
