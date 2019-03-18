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
      total_votes += candidate.votes.count
    end
    total_votes
  end


  def election_status
    if Time.now < voting_start_date
      "Polls not yet open"
    elsif Time.now > voting_end_date
      "Polls closed"
    else
      "Election live"
    end
  end

  def winner
    winner = self.candidatures.first
    self.candidatures.each do |candidate|
      if candidate.total_votes > winner.total_votes
        winner = candidate
      end
    end
    winner
  end

  def turnout
    turnout =(self.total_votes.to_f / self.eligible_voters.count.to_f) * 100
  end

  private

  def end_after_start
    return if voting_end_date.blank? || voting_start_date.blank?

    if voting_end_date < voting_start_date
      errors.add(:voting_end_date, "Error. Voting end date must be after the start date")
    end
  end
end
