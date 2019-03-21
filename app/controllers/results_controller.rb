class ResultsController < ApplicationController
  def index
    @election = Election.find(params[:election_id])
    @candidatures = policy_scope(Candidature.where(election_id: @election.id))
    authorize @candidatures
    @winner = @election.winner
  end
end
