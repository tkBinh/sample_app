class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = t ".flash_sucess_mrp"
      redirect_to root_url
    else
      @feed_items = []
      render "static_pages/home"
    end
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t "static_pages.flash_success_delete"
      redirect_to request.referrer || root_url
    else
      flash[:danger] = t "static_pages.flash_fail_delete"
      redirect_to root_url
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    redirect_to root_url unless @micropost
  end

  def logged_in_user
    return if logged_in?
    flash.now[:danger] = t ".flash_update_dg"
    redirect_to login_url
  end
end
