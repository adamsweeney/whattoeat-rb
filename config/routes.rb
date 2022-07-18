Rails.application.routes.draw do
  resources :recipe_tags
  resources :tags
  resources :recipe_details
  resources :recipes
  resources :books, only: [:create, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
