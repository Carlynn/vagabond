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
    @post = Post.find_by_id(params[:id])
  end

  def update
    user_id = current_user
    post = Post.find_by_id(params[:id])
    location_params = params[:location][:city]
    @location = Location.find_by(city: location_params)
    post.update_attributes(post_params)
    # if save - update attributes
    if post.save
      post.update_attributes(post_params)
      # I THINK THAT THE LOCATION ID SHOULD NOT CHANGE ONCE IT IS CREATED (IT SHOULD BE A NON EDITABLE STATIC FIELD THOUGHTS? AND THEN WE SHOULD NOT UPDATE THE but rather figure out how to undo the push above into the location)
      post.update_attribute(:location_id, @location.id)
    end
    redirect_to post_path(post)
  end
    def show
      @post = Post.find(params[:id])
      # @location = Location.find(params[:id])

    end

  private
  def post_params
    params.require(:post).permit(:title, :description, :id)
  end
end

# Push the post into the first user
# User.first.posts<<Post.first

# Push the post into the location to sure both parts are filled in
# Location.first.posts <<Post.first
