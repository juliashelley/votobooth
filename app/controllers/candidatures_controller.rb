class CandidaturesController < ApplicationController
  def index
    @election = Election.find(params[:election_id])
    @candidatures = Candidature.where(election_id: @election.id)
  end

  def show
    @candidature = Candidature.find(params[:id])
    @election = @candidature.election.id
  end

  def new
    @candidature = Candidature.new
    @election = Election.find(params[:election_id])
  end

  def create
    @candidature = Candidature.new(candidature_params)
    @candidature.user_id = current_user.id
    @election = Election.find(params[:election_id])
    @candidature.election_id = @election.id
    if @candidature.save
      redirect_to election_path(@election.id)
    else
      render :new
    end
  end

  def edit
    @candidature = Candidature.find(params[:id])
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
    @candidature.destroy
    redirect_to election_path(@election.id)
  end

  private

  def candidature_params
    params.require(:candidature).permit!
  end
end
