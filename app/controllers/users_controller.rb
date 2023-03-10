class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user.id)
    else
      render :edit
    end 
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana)
  end
end
