class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def show
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "static_pages.home.err_find_user"
    redirect_to users_path
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "static_pages.home.home_h1"
      redirect_to @user
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
