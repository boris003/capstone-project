class PostsController < ApplicationController

  def new
      render "new.html.erb"
  end

  def create
    @new_post = Post.new(
      title: params[:title],
      description: params[:description],
      user_id: current_user.id
      )
    if @new_post.save
      flash[:success] = "Posted!"
      redirect_to "/posts/#{@new_post.id}"
    end
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
    post = Post.find(params[:id])
    post.destroy
    flash[:danger] = "Your post is deleted!"
    redirect_to "/"
  end

end
