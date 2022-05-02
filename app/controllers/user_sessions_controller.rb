class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:users, success: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, success: 'Logged out!'
  end
end