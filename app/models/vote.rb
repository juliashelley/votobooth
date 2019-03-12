class Vote < ApplicationRecord
  belongs_to :candidature
  belongs_to :eligible_voter
end
