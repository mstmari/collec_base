class BooksController < ApplicationController

  def new
    
    @book = Book.new
  end

  def index
    @books = Book.all
  end


  def show
    @book = Book.find(params[:id])
    @userbook = current_user.user_books.where(:book_id => @book.id)
  end


  def create
    book = Book.new(book_params)
    current_user.user_books << book.user_books
    if book.save

      redirect_to current_user

    else
      render 'new'
    end

  end





  private
  def book_params
    params.require(:book).permit(:id, :title, :author, :volume_number, :user_book_attributes =>[:condition, :description, :price, :user_id, :book_id, :id])
  end

end
