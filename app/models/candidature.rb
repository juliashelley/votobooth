class Candidature < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :election
  belongs_to :user
  validates :name, presence: true
  mount_uploader :picture, PhotoUploader
  validates :status, inclusion: { in: ["Approved", "Pending", "Denied"] }

  def total_votes
    self.votes.count
  end



end
