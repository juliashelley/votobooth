class EligibleVotersController < ApplicationController
  def new
    @election = Election.find(params[:election_id])
    authorize @election
  end

  def destroy
    @eligible_voter = EligibleVoter.find(params[:id])
    @election = Election.find(@eligible_voter.election_id)
    authorize @eligible_voter # authorize before destructive actions
    @eligible_voter.destroy
    redirect_to new_election_eligible_voter_path(@election.id)
  end
end
