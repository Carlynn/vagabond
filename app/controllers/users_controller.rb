class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to user_path(@user)
  end
  def show
    @user = User.find_by_id(params[:id])
    @posts = @user.posts

  end
  def edit
    @user = User.find_by_id(params[:id])
  end
  def update
    user_id = params[:id]
    user = User.find_by_id(user_id)
    user.update_attributes(user_update_params)
    if user.save
      redirect_to user_path(user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :country, :email, :password, :image)
  end
  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :country, :email, :image)
  end
end
