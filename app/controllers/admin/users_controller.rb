class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[show edit update destroy]
  before_action :user_status
  def index
    @users = User.page(params[:page])
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = t('admin.users.update')
      redirect_to admin_user_path(@user)
    else
      flash[:danger] = t('admin.users.errors.error')
      render 'edit'
    end
  end

  private

  def user_status
    if current_user.status == 'admin'
      return true
    else
      redirect_to admin_root_path
    end
  end

  def find_user
    @user = User.find_by_id(params[:id])
    return if @user

    flash[:danger] = t('admin.users.errors.not_found')
    redirect_to admin_root_path
  end

  def user_params
    params.require(:user).permit(:status)
  end
end
