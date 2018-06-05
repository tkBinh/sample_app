class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate params[:session][:password]
      if user.activated?
        log_in user
        check_remember user
        redirect_back_or user
      else
        flash_warning
        redirect_to root_url
      end
    else
      flash_danger
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def flash_warning
    flash[:warning] = t ".err_active"
  end

  def flash_danger
    flash[:danger] = t ".err_login"
  end

  def check_remember user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
  end
end
