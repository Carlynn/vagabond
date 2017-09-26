class PostsController < ApplicationController
  before_action :require_login, except: [:show]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @user = current_user
    location = params[:location][:city]
    @location = Location.find_by(city: location)
    if @post.save
      @user.posts<<@post
      @location.posts<<@post
    end
    redirect_to user_path(@user)
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    post = Post.find_by_id(params[:id])
    location_params = params[:location][:city]
    @location = Location.find_by(city: location_params)
    post.update_attributes(post_params)
    if post.save
      post.update_attributes(post_params)
      post.update_attribute(:location_id, @location.id)
      redirect_to post_path(post)
    else

      flash[:error] = post.errors.messages[:title].join(". ")
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post_id = params[:id]
    post = Post.find_by_id(post_id)
    post.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :id, :image)
  end

  def check_owner
    @post = Post.find_by_id(params[:id])
    if session[:user_id].to_s != @post.user.id.to_s
      redirect_to user_path(current_user)
    end
  end
end
