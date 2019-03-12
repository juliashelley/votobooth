class Election < ApplicationRecord
  has_many :eligible_voters
  has_many :candidatures
  belongs_to :user
end
