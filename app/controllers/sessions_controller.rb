class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:sessions][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination. Please review your login information.'
      render 'new'
    end
  end

  def destroy
  end
end
