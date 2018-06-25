class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
  end

  def show
      @book = Book.find(params[:id])
  end


  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render 'new'
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
    params.require(:book).permit(:title, :author, :volume_number)
  end

end
