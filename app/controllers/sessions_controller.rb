class SessionsController < ApplicationController
  def new
    render 'new.html.erb'
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'You are in!'
      redirect_to '/'
    else
      flash[:warning] = 'Wrong password! Dont you f*ck around with me!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Get Out! Yes! Good! And never come back!'
    redirect_to '/login'
  end
end
