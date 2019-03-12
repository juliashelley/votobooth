class AddReferenceToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :candidatures, foreign_key: true
    add_reference :votes, :eligible_voters, foreign_key: true
  end
end
