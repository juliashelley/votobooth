class VotesController < ApplicationController
  def create
    @candidature = Candidature.find(params[:candidature_id])
    @election = @candidature.election

    if current_user.eligible_voter?
      @eligible_voter = EligibleVoter.find_by(user_id: current_user)
      @vote = Vote.create(candidature_id: @candidature.id, eligible_voter_id: @eligible_voter.id)
      redirect_to election_thank_you_path(@election) if @vote.save!
    else
      redirect_to candidatures_path(@election) # error message
    end
  end
end
