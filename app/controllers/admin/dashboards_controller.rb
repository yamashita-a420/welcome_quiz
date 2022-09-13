class Admin::DashboardsController < Admin::BaseController
  def index
    authorize :application, :index?
  end
end
