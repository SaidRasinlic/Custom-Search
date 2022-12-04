Rails.application.routes.draw do
  resources :articles
  resources :analytics

  post "search", to: "search#search"
  # post 'search' => 'search#search'
  # post "search" => "articles#search"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
end
