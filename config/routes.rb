Rails.application.routes.draw do
  root 'users#index'


  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get  '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#create_facebook'


  resources :books
  resources :user_books
   resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
