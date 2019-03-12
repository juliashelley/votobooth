class AddReferenceToElections < ActiveRecord::Migration[5.2]
  def change
    add_reference :elections, :user, foreign_key: true
    add_reference :elections, :candidature, foreign_key: true
  end
end
