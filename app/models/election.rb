class Election < ApplicationRecord
  has_many :eligible_voters, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validate :end_after_start
  validates :voting_start_date, :voting_end_date, :presence => true

  def total_votes
    total_votes = 0
    @candidates = self.candidatures
    @candidates.each do |candidate|
      candidate.votes
# START HERE TOMORROW - FIX THE BUG WHERE IT DOESN'T COUNT THE NO OF VOTES ASSOCIATED WITH EACH CANDIDATURE (IN ORDER TO TOTAL THEM TO GET TOTAL VOTES CAST SO FAR)
    end
    total_votes
  end

  private

  def end_after_start
    return if voting_end_date.blank? || voting_start_date.blank?

    if voting_end_date < voting_start_date
      errors.add(:voting_end_date, "Error. Voting end date must be after the start date")
    end
  end
end
