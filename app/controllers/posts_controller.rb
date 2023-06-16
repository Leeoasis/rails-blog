class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @post = @user.posts.find(params[:id])
    else
      @post = Post.find(params[:id])
    end
    @comments = @post.comments
  end

  def new
    @post = @current_user.posts.new
  end

  def create
    @post = @current_user.posts.new(post_params)
    if @post.save
      redirect_to user_posts_path(@current_user)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
