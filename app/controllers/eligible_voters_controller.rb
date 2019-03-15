class EligibleVotersController < ApplicationController
  def new
  @election = Election.find(params[:election_id])
 end
end
