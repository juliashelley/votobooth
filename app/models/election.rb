class Election < ApplicationRecord
  has_many :eligible_voters, dependent: :destroy
  has_many :candidatures, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validate :end_after_start
  validates :voting_start_date, presence: true

  def set_time_remaining
    ending_time = self.voting_end_date
    now_time = Time.now

    seconds_diff_float = ending_time - now_time
    seconds_diff = seconds_diff_float.to_i

    days = seconds_diff / 86400
    seconds_diff -= days * 86400

    hours = seconds_diff / 3600
    seconds_diff -= hours * 3600

    minutes = seconds_diff / 60

    @time_remaining = [days, hours, minutes]
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

  def approved_candidates
    self.candidatures.where(status: "approved")
  end

  def pending_candidates
    self.candidatures.where(status: "pending")
  end

  def denied_candidates
    self.candidatures.where(status: "denied")
  end

  private

  def end_after_start
    return if voting_end_date.blank? || voting_start_date.blank?

    if voting_end_date < voting_start_date
      errors.add(:voting_end_date, "Error. Voting end date must be after the start date")
    end
  end
end
