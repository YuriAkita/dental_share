Rails.application.routes.draw do
  get 'blogs/index'
  get 'blogs/new'
  get 'blogs/create'
  get 'blogs/edit'
  get 'blogs/update'
  get 'blogs/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }
  root to: 'top#index'
  resources :users, only: [:show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
