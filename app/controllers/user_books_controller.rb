class UserBooksController < ApplicationController


def edit

  binding.pry
  userbook = UserBook.find(params[:id])

end

  def update
      userbook = UserBook.find(params[:id])
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



end
