class AddFieldsToCandidates < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :aboutme, :string
    add_column :candidatures, :whyme, :string
  end
end
