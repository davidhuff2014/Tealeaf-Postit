# encoding: UTF-8

# Sessions controller
class SessionsController < ApplicationController
  def new

  end

  def create
    # ex user.authentication('password')
    # 1. get the user obj
    # 2. see if password matches
    # 3. if so, log it
    # 4. if not, error message

    user = User.find_by(username: params[:username])

    # do it in this order so a nil user cannot be entered
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'You have logged in!'
      redirect_to root_path
    else
      flash[:error] = 'Something wrong with your username or password.'
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out!'
    redirect_to root_path
  end
end
