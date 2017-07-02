class PostsController < ApplicationController

  def new
      render "new.html.erb"
  end

  def create
    @new_post = Post.create(
      title: params[:title],
      description: params[:description],
      user_id: current_user.id
      )
    flash[:success] = "Posted!"
    redirect_to "/"
  end

  def show
    post_id = params[:id]
    @post = Post.find(post_id)
    render "show.html.erb"
  end

  def myfeed
    @posts = Post.all
    render "myfeed.html.erb"
  end

  def discover
    @posts = Post.all
    render "discover.html.erb"
  end

  def edit
      @post = Post.find(params[:id])
      render "edit.html.erb"
  end

  def update
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      description: params[:description]
      )
    flash[:info] = "You post has been updated!"
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    car = Car.find(params[:id])
    car.destroy
    # render "destroy.html.erb"
    flash[:danger] = "#{car.make} #{car.model} is deleted!"
    redirect_to "/cars"
  end

end
