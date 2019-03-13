class AddReferenceToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :candidature, foreign_key: true
    add_reference :votes, :eligible_voter, foreign_key: true
  end
end
