class SessionsController < ApplicationController
  def new
    # render the login page
  end

  def create
    #at the begging the searched city value is null
    session[:city]  = nil
    user = User.find_by username: params[:username]
    # user is found and the password is correct
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Welcome back!"
    else
      redirect_to signin_path, notice: "Username and/or password mismatch"
    end
  end

  def destroy
    # reset the session
    session[:user_id] = nil
    # redirect to the application main page
    redirect_to :root
  end
end
