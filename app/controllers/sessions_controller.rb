class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      log_in user
<<<<<<< HEAD
      check_remember user
      redirect_back_or user
=======
      redirect_to user
>>>>>>> parent of 5adf118... Merge pull request #5 from thankBinh95/chapter_9
    else
      flash.now[:danger] = t ".err_login"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
