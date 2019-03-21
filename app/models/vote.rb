class Vote < ApplicationRecord
  belongs_to :candidature
  belongs_to :eligible_voter
  validates :candidature_id, uniqueness: { scope: :eligible_voter_id }
  # validate :valid_election_candidate?


  private

  # def valid_election_candidate?
  #   binding.pry unless candidature || eligible_voter
  #   if candidature.election != eligible_voter.election
  #     false
  #   else
  #     true
  #   end
  # end
end
