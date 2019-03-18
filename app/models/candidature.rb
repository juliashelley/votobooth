class Candidature < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :election
  belongs_to :user
  validates :name, presence: true
  mount_uploader :picture, PhotoUploader

  def total_votes
    self.votes.count
  end



  # preferred way of making background picture dynamic
  # def picture_URL
  #   picture.url || "penguin.jpg"
  # end
end
