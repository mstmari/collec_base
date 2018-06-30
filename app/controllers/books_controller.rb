class BooksController < ApplicationController
  # before_action :require_login, only: [:new, :create]

  def new

    @book = Book.new
    binding.pry
    @book.user_books.build
  end

  def index
    @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end

# Weird bug, becasue I am building off of the book instead of the #current_user,
# when I add one book that has already been created it adds
# ALL the copies of that book to the current_user - For instance, the book
# 20,000 Leuges under the sea has 15 user_books and all of them are getting dded to the user.
# I need to either build off of the current_user and then << the copy of the user book into the book.user_books,
# or implement some conditional checking to make sure the user_id is the same on current_user and book.user_books
  def create
    # raise params.inspect
    if book = Book.find_by(title: book_params[:title])
      this_user_book = current_user.user_books.build(book_params[:user_book_attributes])
      current_user.save
      book.user_books << this_user_book
      redirect_to current_user

    else
      book = Book.new(book_params[:book])
        if book.save
          binding.pry
          this_user_book = current_user.user_books.build(book_params[:user_book_attributes])
          current_user.save
          book.user_books << this_user_book

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
    params.require(:book).permit(:title, :author, :volume_number, :user_book_attributes =>[:condition, :description, :price])

  end
#:title, :author, :volume_number, {:user_books_attributes =>
# [ :condition, :description, :price]})
end
