Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "foods#index"
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :create, :destroy, :show] do
    resources :recipe_foods, only: [:new, :edit, :create, :destroy, :update]
  end
  resources :public, only: [:index]
  resources :general, only: [:index]

end
