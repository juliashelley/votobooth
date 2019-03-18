class AddApprovedToCandidatures < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :approved, :boolean, default: false
  end
end
