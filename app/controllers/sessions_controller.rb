class SessionsController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.confirm(login_params)
    if @user
      login(@user)
      flash[:notice] = "Succesfully logged in!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Login incorrect"
      redirect_to login_path
    end
  end
  def destroy
    logout
    flash[:notice] = "Succesfully logged out!"
    redirect_to root_path
  end

  private
  def login_params
    params.require(:user).permit(:email, :password)
  end
end
