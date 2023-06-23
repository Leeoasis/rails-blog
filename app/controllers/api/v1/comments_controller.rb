module Api
  module V1
    class CommentsController < ApplicationController
      skip_before_action :verify_authenticity_token, only: [:create]
      respond_to :json

      def index
        user = User.find(params[:user_id])
        post = user.posts.find(params[:post_id])
        comments = post.comments

        respond_with comments
      end

      def create
        user = User.find(params[:user_id])
        post = user.posts.find(params[:post_id])
        comment = post.comments.build(comment_params)
        comment.author = user

        if comment.save
          render json: comment, status: :created
        else
          render json: { errors: comment.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def comment_params
        params.require(:comment).permit(:text)
      end
    end
  end
end
