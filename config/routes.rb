CVTCRideShare::Application.routes.draw do
  
  get "ride/book"
  devise_for :users
  root :to => 'ride#search'
  
  resources :user
  
  resources :ride do
    collection do
      get 'search'
      get 'results'
    end
  end
  
  resources :request do
    member do
      get 'book'
    end
  end

end