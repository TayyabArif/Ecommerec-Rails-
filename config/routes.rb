Rails.application.routes.draw do
  resources :categories
  resources :line_items
  resources :orders
  get 'orders/index'
  get 'orders/show'
  post 'orders/checkout', to: "orders#stripe_checkout"
  resources :carts
  resources :comments
  resources :products
  get 'product/:id/:page', to: "products#all_products"
  get 'product/:id/comments/:page', to: "comments#my_comments"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations' 
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
