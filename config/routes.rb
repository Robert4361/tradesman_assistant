Rails.application.routes.draw do
  resources :clients
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "measurements#index"

  namespace :admin do
    resources :users
    resources :banks
    put "/activate/:id", to: "users#activate", as: "activate_user"
    root "users#index"
  end

  resources :measurements
  resources :services
  resources :bills

end
