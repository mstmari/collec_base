class UserBooksController < ApplicationController

  def new
    @book = Book.find(params[:book_id])
    @user_book = @book.user_books.build
    @user_book.user_id = current_user.id
  end

  def index
    @books = User.find(params[:user_id]).books.uniq
  end

  def edit
    @user_book = UserBook.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @user_books = current_user.user_books.where(:book => @book)
  end

  def update
      book = UserBook.find(params[:id])
      if book.update(user_books_params)
      redirect_to user_books_path
    else
      render :edit
    end
  end

  def user_books_params
    params.require(:user_book).permit(:condition, :description, :price)
  end

end
