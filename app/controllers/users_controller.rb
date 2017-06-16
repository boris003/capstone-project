class UsersController < ApplicationController

  def index
    #just temporary page
    render "index.html.erb"
  end


  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      nickname: params[:nickname],
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      date_of_birth: params[:date_of_birth],
      location: params[:location],
      drone_model: params[:drone_model],
      bio: params[:bio],
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end
end
