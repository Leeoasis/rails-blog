class ApplicationController < ActionController::Base

  def set_current_user
    @current_user = current_user
  end
end
