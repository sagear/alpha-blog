class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    if @user.save
      flash[:notice] = "Welcome to the Alpha blog #{@user.username}, you have successfully"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def user_param
    params.require(:user).permit(:username, :email, :password)
  end
end