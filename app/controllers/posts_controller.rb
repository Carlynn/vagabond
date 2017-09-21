class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.find(params[:id])
    @post.users.push(current_user)
    # redirect_to current_user
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    post = Post.find(params[:post_id])
  end
end
