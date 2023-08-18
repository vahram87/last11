class Admin::PostsController < ApplicationController
  def index
    @posts = Post.page(params[:page])
  end

   def create
    @post = Post.new(post_params)
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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :contant)
  end
end
