class Admin::UsersController < Admin::BaseController
  def index
    @pagy, @users = pagy(User.all.order(created_at: :desc))
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
