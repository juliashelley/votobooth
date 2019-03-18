class ResultsController < ApplicationController
  def index
    @election = Election.find(params[:election_id])
    @candidatures = Candidature.where(election_id: @election.id)
    @winner = @election.winner
  end
end
