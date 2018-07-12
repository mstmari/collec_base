class BooksController < ApplicationController
  #  before_action: current_user.admin, only: [:new, :create]

  def new

    @book = Book.new
    @book.user_books.build
  end

  def index
    if params[:user_id]
      @books = User.find(params[:user_id]).books.uniq
    else
      @books = Book.all
    end
  end

  def show
    binding.pry
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

  def edit
    @book = UserBook.find(params[:id])
  end

  def update
      book = UserBook.find(params[:id])
      if book.update(condition: params[:user_book][:condition], description: params[:user_book][:description], price: params[:user_book][:price])
      redirect_to user_books_path
    else
      render :edit
    end
  end



  private
  def book_params
    params.require(:book).permit(:id, :title, :author, :volume_number, :user_book_attributes =>[:condition, :description, :price, :user_id, :book_id, :id])
  end

end
