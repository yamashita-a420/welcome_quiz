class QuizzesController < ApplicationController
  skip_before_action :require_login, only: %i[index]

  def index
    @user = User.find(params[:user_id])
  end
end
