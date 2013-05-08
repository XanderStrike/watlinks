class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  def update
    @user = User.find(params[:id])
    if current_user == @user && @user.update_attributes(params[:user])
      redirect_to "/users/#{@user.id}", :notice => "User updated."
    else
      redirect_to "/", :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def edit
    @user = User.find(params[:id])
  end
end