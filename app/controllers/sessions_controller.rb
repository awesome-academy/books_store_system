class SessionsController < ApplicationController
  def new; end

  def create
    session = params[:session]
    user = User.find_by email: session[:email].downcase
    if user && user.authenticate(session[:password])
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = t "invalid"
      render :new
    end
  end

  def destroy
    logout if logged_in?
    redirect_to root_url
  end
end
