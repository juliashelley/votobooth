class AddEligibleVoterColumnToElections < ActiveRecord::Migration[5.2]
  def change
    add_column :elections, :eligible_voters_string, :text
  end
end
