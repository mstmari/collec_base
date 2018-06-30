class BooksController < ApplicationController
  # before_action :require_login, only: [:new, :create]

  def new

    @book = Book.new
    binding.pry
  end

  def index
    @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end


  def create
    if book = Book.find_by(title: book_params[:title])
      this_user_book = current_user.user_books.build(book_params[:user_book_attributes])
      current_user.save
      book.user_books << this_user_book
      redirect_to current_user

    else
      book = Book.new(title: book_params[:title], author: book_params[:author], volume_number: book_params[:volume_number])
        if book.save
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

end
