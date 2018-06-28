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

  def create_facebook
    user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      u.password = random_string
    end
    session[:user_id] = user.id
    redirect_to user_path(user)
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url

  end


  private

  def random_string
    random_string = Random.new.bytes(10)
  end


  def auth
    request.env['omniauth.auth']
  end
end
