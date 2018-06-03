class UsersController < ApplicationController
  before_action :logged_in_user, only: %i(index edit update destroy)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy
  before_action :find_user, only: %i(show edit update destroy)

  def index
    @users = User.order_name.paginate page: params[:page],
      per_page: Settings.num_page
  end

  def new
    @user = User.new
  end

  def show; end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "static_pages.home.home_h1"
      redirect_to @user
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update_attributes user_params
      flash[:success] = t ".flash_update_sc"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t ".flash_update_delete"
    else
      flash[:success] = t ".flash_delete_fail"
    end
    redirect_to users_url
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "static_pages.home.err_find_user"
    redirect_to users_path
  end

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end

  def logged_in_user
    return if logged_in?
    flash.now[:danger] = t ".flash_update_dg"
    redirect_to login_url
  end

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
