class CandidaturesController < ApplicationController
  def index
    @election = Election.find(params[:election_id])
    # @candidatures = @election.approved_candidates
    # policy scope is from pundit to allow us to show candidates on index pages
    @candidatures = policy_scope(@election.approved_candidates)
    authorize @candidatures
  end

  def show
    @candidature = Candidature.find(params[:id])
    @election = @candidature.election.id
    authorize @candidature
  end

  def new
    @candidature = Candidature.new
    @election = Election.find(params[:election_id])
    authorize @election
  end

  def create
    @candidature = Candidature.create(candidature_params)
    @candidature.user_id = current_user.id
    @election = Election.find(params[:election_id])
    @candidature.election_id = @election.id
    authorize @candidature
    if @candidature.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def photo?
    @candidature = Candidature.new(candidature_params)
    @candidature.picture.nil?
  end

  def edit
    @candidature = Candidature.find(params[:id])
    authorize @candidature
  end

  def update
    @candidature = Candidature.find(params[:id])
    @candidature.update(candidature_params)
    if @candidature.save
      redirect_to election_path(@election.id)
    else
      render :edit
    end
  end

  def destroy
    @candidature = Candidature.find(params[:id])
    @election = Election.find(@candidature.election_id)
    authorize @candidature
    @candidature.destroy
    redirect_to election_path(@election.id)
  end

  def approval
    @election = Election.find(params[:election_id])
    @candidates = policy_scope(@election.pending_candidates)
  end

  def deny
    @election = Election.find(params[:election_id])
    @candidate = Candidature.find(params[:candidature_id])
    authorize @candidate
    @candidate.status = "denied"
    if @candidate.save
      redirect_to election_approval_path(@election)
    else
      render :approval
    end
  end

  def accept
    @election = Election.find(params[:election_id])
    @candidate = Candidature.find(params[:candidature_id])
    authorize @candidate
    @candidate.status = "approved"
    if @candidate.save
      redirect_to election_approval_path(@election)
    else
      render :approval
    end
  end

  private

  def candidature_params
    params.require(:candidature).permit!
  end
end
