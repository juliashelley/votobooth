class Candidature < ApplicationRecord
  has_many :votes, dependent: :destroy
  belongs_to :election
  belongs_to :user
  validates :name, presence: true
  mount_uploader :picture, PhotoUploader
end
