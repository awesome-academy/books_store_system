Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users, only: %i(new create show)
    resources :products, only: :show
    resources :reviews, only: %i(new create)
    resources :carts, only: %i(index create update destroy)
    resources :orders, only: %i(create index)
    resources :categories, only: :show
    get "/search", to: "search_products#search"
    get "/newproduct", to: "newproducts#index"
    get "/topsale", to: "topsales#index"
    namespace :admin do
      root "/admin#index"
      resources :categories, only: %i(new create)
      resources :products, only: %i(new create)
    end
  end
end
