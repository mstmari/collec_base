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
    # binding.pry
    # if
    #   @book = Book.find_by(title: book_params[:title])
    #   new_user_book = @book.user_books.build(book_params[:user_book_attributes])
    #
    #   current_user.user_books << new_user_book
    #
    #   current_user.save
    #
    #   redirect_to current_user

    # else
      @book = Book.new(book_params)
      current_user.user_books << @book.user_books
      if @book.save
        current_user.save

        redirect_to current_user

      else
        render 'new'
      end
    #  end
  end

  def edit
    userbook = UserBook.find(params[:id])
    @book = userbook.book
  end

  def update

      book = Book.find(params[:id])
       binding.pry
      #  userbook = current_user.user_books.find(book_params[:user_book_attributes][:id])
       #  binding.pry
      #  userbook.update(book_params[:user_book_attributes])

       book.update(book_params) if book.owner_id == current_user.id


    #  current_user.save
    # binding.pry
     if book.save
      redirect_to book
    else
      render :edit
    end
  end



  private
  def book_params
    params.require(:book).permit(:title, :author, :volume_number, :owner_id, :user_book_attributes =>[:condition, :description, :price, :user_id, :book_id, :id])
  end

end
