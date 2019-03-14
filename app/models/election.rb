class Election < ApplicationRecord
  has_many :eligible_voters, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validate :end_after_start
  validates :voting_start_date, :voting_end_date, :presence => true

  def set_time_remaining
    hour = Time.now.hour - voting_end_date.hour
    min = Time.now.min - voting_end_date.min
    sec = Time.now.sec - voting_end_date.sec
    @time_remaining = [hour, min, sec]
  end
  
  def total_votes
    total_votes = 0
    @candidates = self.candidatures
    @candidates.each do |candidate|
      candidate.votes
      binding.pry
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
