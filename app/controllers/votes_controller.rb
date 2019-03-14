class VotesController < ApplicationController
  def create
    @candidature = Candidature.find(params[:candidature_id])
    @election = @candidature.election

    if current_user.eligible_voter?
      @eligible_voter = EligibleVoter.find_by(user_id: current_user)
      @vote = Vote.create(candidature_id: @candidature.id, eligible_voter_id: @eligible_voter.id)
      redirect_to candidature_confirmation_path(@candidature) if @vote.save!
    else
      flash[:alert] = "You are not an eligible voter for this election. Please sign in or contact your election manager"
      redirect_to election_candidatures_path(@election) # error message
    end
  end

  def thank_you
  end

  def confirmation
    @candidature = Candidature.find(params[:candidature_id])
    @election = @candidature.election
  end
end
