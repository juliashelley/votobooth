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
    if @election.save
      redirect_to new_election_eligible_voter_path(@election.id)
    else
      render :new
    end
  end

  def edit
    @election = Election.find(params[:id])
  end

  def update
    @election = Election.find(params[:id])
    @election.update(election_params)
    if @election.save
      redirect_to election_path(@election.id)
    else
      render :edit
    end
  end

  def show
    @election = Election.find(params[:id])
  end

  private

  def election_params
    params.require(:election).permit!
  end
end
