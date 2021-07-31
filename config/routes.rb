Rails.application.routes.draw do
  get 'reviews/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  root to: 'top#index'
  resources :users, only: [:show]
  resources :blogs do
    collection do
      post :confirm
    end
  resources :reviews
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
