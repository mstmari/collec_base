class UsersController < ApplicationController

  def index
    @user = User.new
  end

  def new
    @user = User.new
  end

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  def create
    # binding.pry
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :admin)
  end

end
