class EligibleVoter < ApplicationRecord
  belongs_to :election
  belongs_to :user
  has_many :vote
end
