class DashboardsController < ApplicationController
  def show
    @elections = current_user.elections
    @candidatures = current_user.candidatures
    @voter = current_user.eligible_voters
    authorize @elections
  end
end
