class VotesController < ApplicationController
  before_action :find_candidate
  before_action :set_election

  def create
    if current_user.eligible_voter?
      @eligible_voter = EligibleVoter.find_by(user_id: current_user)
      @vote = Vote.create(candidature_id: @candidature.id, eligible_voter_id: @eligible_voter.id)
      redirect_to candidature_thank_you_path(@candidature) if @vote.save!
    else
      flash[:alert] = "Something went wrong. Please sign in or contact your election manager."
      render :confirmation
    end
  end

  def thank_you
    flash[:alert] = "Your vote was successfully cast"
  end

  def confirmation
  end

  private

  def find_candidate
    @candidature = Candidature.find(params[:candidature_id])
  end

  def set_election
    find_candidate
    @election = @candidature.election
  end
end
