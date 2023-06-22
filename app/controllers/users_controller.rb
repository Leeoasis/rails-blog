class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @users = User.all
    @current_user = current_user
  end

  def show
    @user = User.find(params[:id])
  end
end
