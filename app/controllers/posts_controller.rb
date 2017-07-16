class PostsController < ApplicationController

  def new
    @tags = Tag.all
    @current_user = User.find_by(id: session[:user_id])
    if @current_user == nil
      redirect_to "/getout"
      flash[:warning] = 'What a hell are you doing? Want to create a post without logging in?! Get a hell out of my web site!'
    else
      render "new.html.erb"
    end
  end

  def create
    post = Post.new(
      title: params[:title],
      description: params[:description],
      image: params[:image],
      user_id: current_user.id
      )
    if post.save
      params[:tag_ids].each do |tag_id|
        PostTag.create(
          post_id: post.id,
          tag_id: tag_id
          )
      end
      flash[:success] = "Posted!"
      redirect_to "/posts/#{post.id}"
    end
  end

  def index
    @posts = Post.all
  end

  def show
    post_id = params[:id]
    @post = Post.find(post_id)
    render "show.html.erb"
  end

  def myfeed
    @current_user = User.find_by(id: session[:user_id])
    @subscriptions = Subscription.find_by(subscriber_id: @current_user.id)
    @subscribed_to_ids = []
    if @subscriptions.is_a?(Array)
      @subscriptions.each do |subscription|
        @subscribed_to_ids << subscription.subscribed_to_id
      end
    else
      @subscribed_to_ids << @subscriptions.subscribed_to_id
    end
    @posts = []
    @subscribed_to_ids.each do |userid|
      @posts << Post.find_by(user_id: userid)
    end
    render "myfeed.html.erb"
  end

  def discover
    @current_user = User.find_by(id: session[:user_id])
    @user_tags = UserTag.find_by(user_id: @current_user.id)
    @tag_ids = []
    if @user_tags.is_a?(Array)
      @user.tags.each do |usertag|
        @tag_ids << usertag.tag_id
      end
    else
      @tag_ids << @user_tags.tag_id
    end
    @posts = []
    @tag_ids.each do |tagid|
      tag = Tag.find_by(id: tagid)
      @posts = tag.posts
    end
    render "discover.html.erb"
  end

  def edit
      @post = Post.find(params[:id])
      @tags = Tag.all
      # @post_tags_ids = []
      # @post_tags = @post.tags
      # @post_tags.each do |tag|
      #   @post_tag_ids << tag.id
      # end
      render "edit.html.erb"
  end

  def update
    @post = Post.find(params[:id])
    @post.update(
      title: params[:title],
      description: params[:description]
      )
    @post.tags.destroy_all
    params[:tag_ids].each do |tag_id|
      PostTag.create(
        post_id: @post.id,
        tag_id: tag_id
        )
    end
    flash[:info] = "You post has been updated!"
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:danger] = "Your post is deleted!"
    redirect_to "/"
  end

  def newcomment
    comment = Comment.new(
      content: params[:content],
      post_id: params[:post_id],
      user_id: current_user.id
      )
    if comment.save
      flash[:success] = "Comment sent"
      redirect_to "/posts/#{params[:post_id]}"
    end
  end





    # = = = Error pages! = = = 
  def getout
    render "getout.html.erb"
  end

  def didntitellyou
    render "didntitellyou.html.erb"    
  end

  def ohgod
    render 'ohgod.html.erb'    
  end

end
