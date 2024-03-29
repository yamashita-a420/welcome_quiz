class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include Pagy::Backend
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, alert: t('defaults.message.require_login')
  end
end
