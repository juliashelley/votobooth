class RemoveResultsFromElections < ActiveRecord::Migration[5.2]
  def change
    remove_column :elections, :results, :integer
  end
end
