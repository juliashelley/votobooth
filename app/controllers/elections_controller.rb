class ElectionsController < ApplicationController

  def index
    @elections = Election.where(user_id: current_user.id)
  end

  def new
    @election = Election.new
  end

  def create
    @election = Election.new(election_params)
    @election.user_id = current_user.id


    if @election.save?
      redirect_to elections_path
    else
      render :new
    end
  end

  private

  def election_params
    params.require(:election).permit!
  end
end
