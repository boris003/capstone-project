class UsersController < ApplicationController

  def index
    #just temporary page
    render "index.html.erb"
  end


  def new
    @tags = Tag.all
    @tag_ids = []
    render 'new.html.erb'
  end

  def create
    @tags = Tag.all
    user = User.new(
      nickname: params[:nickname],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      date_of_birth: params[:date_of_birth],
      location: params[:location]
      )
    UserTag.create(
      user_id: user.id,
      tag_id: params[:tag_id]
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

  def edit
    @current_user = User.find_by(id: session[:user_id])
    @user = User.find(params[:id])
    if @current_user == nil
      redirect_to "/"
    elsif @current_user.id == @user.id
      render "edit.html.erb"
    else
      redirect_to "/"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      date_of_birth: params[:date_of_birth],
      location: params[:location],
      drone_model: params[:drone_model],
      bio: params[:bio]
      )
    flash[:info] = "Information is updated!"
    redirect_to "/"
    # redirect_to "/users/#{@user.id}"
  end

  def show
    @current_user = User.find_by(id: session[:user_id])
    @user = User.find(params[:id])
    render "show.html.erb"
    
  end
end
