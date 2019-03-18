class EligibleVoter < ApplicationRecord
  belongs_to :election
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :user_id, uniqueness: { scope: :election_id }
end
