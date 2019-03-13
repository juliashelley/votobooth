class DashboardsController < ApplicationController
  def show
    @elections = current_user.election
  end
end
