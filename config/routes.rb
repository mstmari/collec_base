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
  get '/most_popular' => 'books#most_popular'

  resources :users do
    resources :user_books, :path => "books", :as => :books
  end
  resources :books
  # user_books resource is aliased as "books" for better user experience.
  # URL is now 'user/1/books/1 where the book id represents the canonical book.
  # The User_book itself doesn't have an idea represented in the URL,
  # becasue a user can have multiple copies of the same book

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
