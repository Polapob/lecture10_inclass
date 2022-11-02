Rails.application.routes.draw do
  get 'shop/:id', to: 'shop#main'
  get 'shop/main'
  resources :inventories
  get 'inventory/show'
  resources :items
  get 'main/login'
  post 'main/login', to: 'main#login_post'
  get 'main/user_items', to: 'items#index'
  get 'main/inventories', to: 'inventories#index'
  get 'inventories/buy/:item_id/:vendor_id', to: 'shop#buy'
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end