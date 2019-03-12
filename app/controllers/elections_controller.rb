class ElectionsController < ApplicationController

  def index
    @elections = Election.where(user_id: current_user.id)
  end
end
