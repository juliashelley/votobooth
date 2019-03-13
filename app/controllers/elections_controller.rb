class ElectionsController < ApplicationController
require 'securerandom'

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
      unless election_params[:eligible_voters_string].nil?
        assign_eligible_voters(@election)
      end
      redirect_to election_path(@election.id)
    else
      render :edit
    end
  end

  def show
    @election = Election.find(params[:id])
  end

  private

  def assign_eligible_voters(election)
    email_array = election.eligible_voters_string.scan(/[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/)
    email_array.each do |email|
      user = User.find_by(email: email)
      if user.nil?
        user = User.new(email: email, password: SecureRandom.hex(8))
      end
      user.save
      eligible_voters = EligibleVoter.new(user_id: user.id, election_id: election.id)
      eligible_voters.save
    end
  end

  def election_params
    params.require(:election).permit!
  end
end
