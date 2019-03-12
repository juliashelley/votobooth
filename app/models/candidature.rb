class Candidature < ApplicationRecord
  has_many :vote
  belongs_to :election
  belongs_to :user
  validates :name, presence: true
end
