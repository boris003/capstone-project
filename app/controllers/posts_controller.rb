class PostsController < ApplicationController

  def new
      render "new.html.erb"
  end

  def create
    @new_post = Post.create(
      title: params[:title],
      description: params[:description],
      user_id: @current_user.id
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
    render "myfeed.html.erb"
  end

  def discover
    render "discover.html.erb"
  end

end