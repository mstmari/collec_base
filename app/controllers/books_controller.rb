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
    binding.pry
    # if
    #   @book = Book.find_by(title: book_params[:title])
    #   new_user_book = @book.user_books.build(book_params[:user_book_attributes])
    #
    #   current_user.user_books << new_user_book
    #
    #   current_user.save
    #
    #   redirect_to current_user
    #
    # else
      @book = Book.new(book_params)
      current_user.user_books << @book.user_books
      if @book.save
        current_user.save

        redirect_to current_user

      else
        render 'new'
      end
    # end
  end

  def edit
    binding.pry
    @book = Book.find(params[:id])
    @userbook = @book.user_books.find_by(:user_id => current_user.id)
  end

  def update
    #Figure out why your user_id/book_id are not being passed through params.
    #How can I change to program so that one user can't
    #make a change to a book and it change every instance of that book.
    #maybe a user can't edit a book once it has been created and can ONLY edit a user_book, or get rid of the
    #find_by in the create method and just create new a Book everytime and keep the edit functionality

      book = Book.find(params[:id])
      binding.pry
      userbook = current_user.user_books.find(book_params[:user_book_attributes][:id])
      userbook.update(book_params[:user_book_attributes])

      # if book.owner_id == session_id
      #  book.update(book_params)


     current_user.save

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
