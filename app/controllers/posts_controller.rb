class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
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
    user = User.find(params[:id])
    @post = user.posts.find_by_id(params[:post_id])
  end

  def update
    user_id = current_user
    post = Post.find_by_id(params[:post_id])
    location_params = params[:location][:city]
    @location = Location.find_by(city: location_params)
    post.update_attributes(post_params)
    # if save - update attributes
    if post.save
      post.update_attributes(post_params)
      # I THINK THAT THE LOCATION ID SHOULD NOT CHANGE ONCE IT IS CREATED (IT SHOULD BE A NON EDITABLE STATIC FIELD THOUGHTS? AND THEN WE SHOULD NOT UPDATE THE but rather figure out how to undo the push above into the location)
      @location.update_attribute(:city, location_params)
    end
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:post).permit(:title, :description)
  end
end

# Push the post into the first user
# User.first.posts<<Post.first

# Push the post into the location to sure both parts are filled in
# Location.first.posts <<Post.first
