class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @post = @current_user.posts.find(params[:post_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @user
    if @comment.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
