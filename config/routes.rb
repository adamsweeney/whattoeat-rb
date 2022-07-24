Rails.application.routes.draw do
  resources :tags, only: [:index]
  resources :recipes, only: [:create] do
    collection do
      get :random
    end
  end
  resources :books, only: [:create, :index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
