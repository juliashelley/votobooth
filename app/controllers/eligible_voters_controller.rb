class EligibleVotersController < ApplicationController
  def new
    @election = Election.find(params[:election_id])
  end

  def create
    election = Election.find(params[:election_id])
    @eligible_voter.election = election.id
    @eligible_voter = EligibleVoter.new(params[:id])
    if @eligible_voter.save
      UserMailer.with(user: @eligible_voter).eligible_email.deliver.now
    else
      render :new
    end
  end

  def destroy
    @eligible_voter = EligibleVoter.find(params[:id])
    @election = Election.find(@eligible_voter.election_id)
    @eligible_voter.destroy
    redirect_to new_election_eligible_voter_path(@election.id)
  end
end
