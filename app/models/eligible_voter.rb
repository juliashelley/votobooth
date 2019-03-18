class EligibleVoter < ApplicationRecord
  belongs_to :election
  belongs_to :user
  has_many :votes, dependent: :destroy
  validates :user_id, uniqueness: { scope: :election_id }
  after_create :send_eligible_mail

  private

  def send_eligible_mail
    UserMailer.with(user: self.user).eligible_email(self.user).deliver_now
  end
end
