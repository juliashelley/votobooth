class Vote < ApplicationRecord
  belongs_to :candidature
  belongs_to :eligible_voter
  validates :candidature_id, uniqueness: { scope: :eligible_voter_id }
end
