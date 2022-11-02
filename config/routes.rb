Rails.application.routes.draw do
  resources :inventories
  get 'inventory/show'
  resources :items
  get 'main/login'
  post 'main/login', to: 'main#login_post'
  get 'main/user_items', to: 'items#index'
  get 'main/inventories', to: 'inventories#index'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end