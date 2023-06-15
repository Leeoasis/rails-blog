class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = if params[:user_id].present?
              @user.posts.find(params[:author_id])
            else
              Post.find(params[:id])
            end
    @comments = @post.comments
  end
end
