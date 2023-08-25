class Admin::HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :user_status
  def index
  end

  private
  def user_status
    if current_user.status == 'user'
      redirect_to root_path
    else
      return true
    end
  end
end
