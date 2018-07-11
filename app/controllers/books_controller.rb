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
  end

  def update
      book = Book.find(params[:id])
      # userbook = current_user.user_books.find(book_params[:user_book_attributes][:id])
      # the above line of code finds the unique instance of a userbook by :id in order to update it,
      # however, the :id coming through the hidden_field throws off the params and gives the uniqueness error.
      # in order for the above method to work you have to pass the user_books.id through a hidden_field on the edit form.
      # but then calling book.update(book_params) will break

       #  binding.pry
      #  userbook.update(book_params[:user_book_attributes])
        if book.update(book_params)

      #   if book.owner_id == current_user.id


    #  current_user.save
    # binding.pry
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
