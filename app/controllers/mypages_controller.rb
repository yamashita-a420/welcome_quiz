class MypagesController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to mypage_path, success: t('defaults.message.updated', item: "プロフィール")
    else
      flash.now[:danger] = t('defaults.message.not_updated', item: "プロフィール")
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
