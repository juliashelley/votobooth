class AddReferenceToCandidatures < ActiveRecord::Migration[5.2]
  def change
    add_reference :candidatures, :user, foreign_key: true
    add_reference :candidatures, :election, foreign_key: true
  end
end
