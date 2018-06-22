class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
   binding.pry
    @book = Book.new(user_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
    end
  end

  private
  def book_params
    params.require(:user).permit(:name, :password, :admin)
  end

end
