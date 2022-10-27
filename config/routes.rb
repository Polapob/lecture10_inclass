Rails.application.routes.draw do
  resources :items
  get 'main/login'
  post 'main/login' ,to: "main#login_post"
  get 'main/inventories'
  get 'main/user_items', to:"items#index"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
