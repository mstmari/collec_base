class SessionsController < ApplicationController
  def new
    # binding.pry
    @user = User.new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id

      redirect_to user_path(user)
    else
      redirect_to '/signin'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url

  end


  private

  def auth
    request.env['omniauth.auth']
  end
end
