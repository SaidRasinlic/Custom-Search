Rails.application.routes.draw do
  resources :articles, only: [:index, :show]
  resources :analytics

  post "search", to: "search#search"
  get "show", to: "articles#show"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
