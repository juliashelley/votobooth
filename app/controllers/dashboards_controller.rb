class DashboardsController < ApplicationController
  def show
    @elections = current_user.elections
  end
end
