class LikesController < ApplicationController
  before_action :find_user, only: %i[new create]
  before_action :find_post, only: :create

  def new; end

  def create
    @like = @post.likes.new(author: @user)
    if @like.save
      redirect_to user_post_path(@user, @post)
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
