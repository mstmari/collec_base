class BooksController < ApplicationController
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
    @book = Book.find(params[:id])
    @userbook = current_user.user_books.where(:book_id => @book.id)

  end


  def create
    if
      book = Book.find_by(title: book_params[:title])
      new_user_book = book.user_books.build(book_params[:user_book_attributes])

      current_user.user_books << new_user_book

      current_user.save

      redirect_to current_user

    else
      book = Book.new(book_params)
      current_user.user_books << book.user_books
      if book.save
        current_user.save

        redirect_to current_user

      else
        redirect_to '/'
      end
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update

    book = Book.find(params[:id])
    binding.pry
    userbook = current_user.user_books.find_by(:book_id => book_params[:book_id])

    userbook.update(book_params[:user_book_attributes])
    book.update(book_params)

    current_user.user_books << userbook

    current_user.save
    #Figure out why your user_id/book_id are not being passed through params.

    if book.save
      redirect_to book
    else
      render :edit
    end
  end



  private
  def book_params
    params.require(:book).permit(:title, :author, :volume_number, :user_book_attributes =>[:condition, :description, :price, :user_id, :book_id])

  end

end
