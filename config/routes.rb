Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "measurements#index"

  namespace :admin do
    resources :users
    resources :banks
    put "/activate/:id", to: "users#activate", as: "activate_user"
  end

  resources :measurements

end
