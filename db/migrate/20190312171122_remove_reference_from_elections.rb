class RemoveReferenceFromElections < ActiveRecord::Migration[5.2]
  def change
    remove_column :elections, :candidature_id
  end
end
