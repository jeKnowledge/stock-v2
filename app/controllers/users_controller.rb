class UsersController < ApplicationController

  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    if logged_in? && admin_user?
      @user_admin = current_user.admin
    else
      flash[:danger] = "You are not a admin"
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
    if !logged_in?
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user_items = user.items
    user_items.each do |item|
      item.state = false
      item.user_id = nil 
      item.save
    end
    user.items.where(user_id: user.id).destroy_all
    user.destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
