Rails.application.routes.draw do
  devise_for :users
  root to: "characters#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :worlds
    resources :characters
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
