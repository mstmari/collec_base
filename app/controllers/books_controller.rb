class BooksController < ApplicationController
  # before_action :require_login, only: [:new, :create]

  def new
    @book = Book.new
    @book.user_books.build
  end

  def index
    @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end


  def create
    # binding.pry
    if book = Book.find_by(title: book_params[:title])
      #  binding.pry
      book.user_books.build(book_params[:user_books_attributes])
      # current_user.user_books.create(book_id: book.id,
      # condition: params[:book][:userbook][:condition],
      # description: params[:book][:userbook][:description],
      # price: params[:book][:userbook][:price])
      book.save
      current_user.user_books << book.user_books
      redirect_to current_user

    else
      book = Book.new(title: book_params[:title], author: book_params[:author], volume_number: book_params[:volume_number])
        if book.save
          book.user_books.build(book_params[:user_books_attributes])
        # current_user.user_books.create(book_id: book.id,
        # condition: params[:book][:userbook][:condition],
        # description: params[:book][:userbook][:description],
        # price: params[:book][:userbook][:price])
        current_user.user_books << book.user_books


        redirect_to current_user

        else
          render 'new'
        end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    @book.update(book_params)

    if @book.save
      redirect_to @book
    else
      render :edit
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :volume_number, :user_books_attributes =>[:condition, :description, :price])

  end
#:title, :author, :volume_number, {:user_books_attributes =>
# [ :condition, :description, :price]})
end
