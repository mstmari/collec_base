Rails.application.routes.draw do
  root 'users#welcome'


  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get  '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get  '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  get  '/most_valuble' => 'users#most_valuble'
  get  '/auth/facebook/callback' => 'sessions#create_facebook'
  post '/users/:id/books/new' => 'user_books#create'

  resources :users do
    resources :user_books, :path => "books", :as => :books
  end
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
