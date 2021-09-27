Rails.application.routes.draw do
  root to: 'books#index'

  resources :books, only: %i[index show] do
    get :search, on: :collection
  end
  namespace :api do
    resources :books, only: %i[index]
  end
end
