class ElectionsController < ApplicationController
require 'securerandom'

  def index
    @elections = Election.where(user_id: current_user.id)
  end

  def new
    @election = Election.new
  end

  def create
    @election = Election.new(election_params)
    @election.user_id = current_user.id
    @election.voting_start_date = @election.dates.split(' to ')[0]
    @election.voting_end_date = @election.dates.split(' to ')[1]
    if @election.save
      redirect_to new_election_eligible_voter_path(@election.id)
    else
      render :new
    end
  end

  def edit
    @election = Election.find(params[:id])
  end

  def update
    @election = Election.find(params[:id])
    @election.update(election_params)
    if @election.save
      unless election_params[:eligible_voters_string].nil?
        assign_eligible_voters(@election)
        redirect_to new_election_eligible_voter_path(@election.id)
        return
      end
      redirect_to election_path(@election.id)
    else
      render :edit
    end
  end

  def show
    @election = Election.find(params[:id])
  end

  private

  def assign_eligible_voters(election)
    email_array = election.eligible_voters_string.scan(/[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/)
    email_array.each do |email|
      user = User.find_by(email: email)
      if user.nil?
        password = SecureRandom.hex(8)
        user = User.new(email: email, password: password)
        user.save
        UserMailer.with(user: user).eligible_email(user, election, password).deliver_now
      else
        UserMailer.with(user: user).existing_voter(user, election).deliver_now
      end
        eligible_voters = EligibleVoter.new(user_id: user.id, election_id: election.id)
        eligible_voters.save
    end
  end

  def election_params
    params.require(:election).permit!
  end
end
