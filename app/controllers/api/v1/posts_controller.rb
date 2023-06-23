module Api
  module V1
    class PostsController < ApplicationController
      respond_to :json
      def index
        user = User.find(params[:user_id])
        posts = user.posts
        respond_with posts
      end
    end
  end
end
