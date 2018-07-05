class BooksController < ApplicationController

  def new
    @book = Book.new
    2.times { @book.user_books.build }
    # @book.user_books.user_id = current_user.id
  end

  def index
    @books = current_user.books
  end

  def show
     binding.pry
      @book = Book.find(params[:id])
      @book
  end


  def create
    binding.pry
    if book = Book.find_by(title: book_params[:title])
      this_user_book = current_user.user_books.build(book_params[:user_book_attributes])
      current_user.save
      book.user_books << this_user_book
      redirect_to current_user

    else
      # binding.pry
      book = Book.new(book_params)
      binding.pry
        if book.save
          this_user_book = current_user.user_books.build(book_params[:user_book_attributes])
          current_user.save
          book.user_books << this_user_book

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
    params.require(:book).permit(:title, :author, :volume_number, :user_book_attributes =>[:condition, :description, :price, :user_id])

  end

end
