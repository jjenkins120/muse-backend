Rails.application.routes.draw do
  resources :follows
  resources :post_tags
  resources :user_posts
  resources :tags
  resources :posts
  resources :users

  post '/users/sessions/login', to: 'users#login'
  get '/users/sessions/current_session', to: 'users#current_session'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
