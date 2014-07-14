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

    # user = User.where(username: params[:username]).first # only get the first
    # also returns an array
    user = User.find_by(username: params[:username])

    # do it in this order so a nil user cannot be entered
    if user && user.authenticate(params[:password])
      if user.two_factor_auth?
        # geb a pin
        session[:two_factor] = true
        user.generate_pin!
        # send pin to twilio,  sms to user's phone
        user.send_pin_to_twilio
        # show pin form
        redirect_to pin_path
      else
        login_user!(user)
      end
    else
      flash[:error] = 'Something is wrong with your username or password.'
      redirect_to register_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have logged out!'
    redirect_to root_path
  end

  def pin
    access_denied if session[:two_factor].nil?

    if request.post?
      user = User.find_by pin: params[:pin]
      if user
        # remove pin
        session[:two_factor] = nil
        user.remove_pin!
        # normal login success
        login_user!(user)
      else
        flash[:error] = 'Something is wrong with your pin number.'
        redirect_to pin_path
      end
    end
  end

  private

  def login_user!(user)
    session[:user_id] = user.id
    flash[:notice] = "Welcome, #{user.username} you are now logged in!"
    redirect_to root_path
  end
end
