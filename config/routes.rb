Rails.application.routes.draw do
  resources :books, only: %i[index show] do
    get :search, on: :collection
  end
end
