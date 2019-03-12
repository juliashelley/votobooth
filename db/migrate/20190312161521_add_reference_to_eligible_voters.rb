class AddReferenceToEligibleVoters < ActiveRecord::Migration[5.2]
  def change
    add_reference :eligible_voters, :election, foreign_key: true
    add_reference :eligible_voters, :user, foreign_key: true
  end
end
