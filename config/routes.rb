Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :cart_items, only: [:create, :destroy] # o el método que uses para gestionar el carrito
  get 'cart', to: 'cart_items#index', as: 'cart' # Asegúrate de tener la ruta para mostrar el carrito


  root 'products#index'

  resources :payments
  resources :reviews
  resources :product_promotions
  resources :promotions
  resources :cart_items
  resources :product_categories

  resources :categories

  resources :categories, only: [:create]

  resources :users
  resources :order_items
  resources :orders
  resources :products
  resources :customers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
