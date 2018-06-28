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
    if book = Book.find_by(title: params[:book][:title])
      current_user.user_books.build(book_id: book.id,
      condition: params[:book][:userbook][:condition],
      description: params[:book][:userbook][:description],
      price: params[:book][:userbook][:price])
      current_user.user_books.last.save
      redirect_to current_user
    else
      @book = Book.new(book_params)
        if @book.save
      redirect_to book_path(@book)
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
    params.require(:book).permit(:title, :author, :volume_number)
  end
# , :userbook => [ :condition, :description, :price]
end
