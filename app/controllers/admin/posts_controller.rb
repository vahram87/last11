class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.page(params[:page])
  end

  def new
    @post = Post.new
  end

   def create
    user = current_user
    @post = user.posts.create(post_params)
    if @post.save
      flash[:success] = t('admin.posts.create')
      redirect_to admin_post_path(@post)
    else
      flash[:danger] = t('admin.posts.error')
      redirect_to new_admin_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to admin_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :photo)
  end
end
