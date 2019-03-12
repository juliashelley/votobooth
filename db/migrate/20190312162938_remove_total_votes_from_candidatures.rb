class RemoveTotalVotesFromCandidatures < ActiveRecord::Migration[5.2]
  def change
    remove_column :candidatures, :total_votes, :integer
  end
end
