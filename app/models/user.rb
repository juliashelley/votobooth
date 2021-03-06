class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :eligible_voters
  has_many :candidatures
  has_many :elections
  validates :email, presence: true

  def eligible_voter?
    EligibleVoter.find_by(user_id: self.id) ? true : false
  end
end
