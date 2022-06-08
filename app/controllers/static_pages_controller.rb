class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  layout 'layouts/maker_top'

  def top; end
end
