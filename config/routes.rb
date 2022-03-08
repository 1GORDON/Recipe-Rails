Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "foods#index"
  resources :foods, only: [:index, :new]
  resources :recipes, only: [:index]
  resources :public, only: [:index]
  resources :general, only: [:index]
end
