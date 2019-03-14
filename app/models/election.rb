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
    @time_group = [hour, min, sec]
  end

  private

  def end_after_start
    return if voting_end_date.blank? || voting_start_date.blank?

    if voting_end_date < voting_start_date
      errors.add(:voting_end_date, "Error. Voting end date must be after the start date")
    end
  end
end
