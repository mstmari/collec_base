class UserBooksController < ApplicationController

  def new
    binding.pry
    userbook = UserBook.new(user_id: params[:user_id], book_id: params[:book_id])
    # @message = userbook.take_ride
    # flash[:notice] = @message
    # redirect_to ride.user
  end

end
