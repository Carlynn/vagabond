class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :user_params, :show]
  before_action :check_owner, only: [:edit, :update, :password_update]

  def index
    redirect_to root_path
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
    @user = User.friendly.find(params[:slug])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(5)
  end

  def edit
    @user = User.friendly.find(params[:slug])
  end

  def update
    user = User.find(params[:slug])
    user.update_attributes(user_update_params)
    if user.save
      redirect_to user_path(user)
    end
  end

  def password
    @user = User.friendly.find(params[:slug])
    render :password_update
  end

  def password_update
    user = User.find(params[:slug])
    user.update_attributes(update_password_params)
    if user.save
      flash[:notice] = "Succesfully updated password!"
      redirect_to user_path(user)
    else
      flash[:notice] = "Password not changed, please try again!"
      redirect_back(fallback_location: user_path(user))
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :country, :email, :password, :image)
  end

  def user_update_params
    params.require(:user).permit(:first_name, :last_name, :city, :state, :country, :email, :image)
  end

  def update_password_params
    params.require(:user).permit(:password)
  end

  def check_owner
    if session[:user_id] != User.friendly.find(params[:slug]).id
      redirect_to user_path(current_user)
    end
  end
end
