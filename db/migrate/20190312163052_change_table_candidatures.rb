class ChangeTableCandidatures < ActiveRecord::Migration[5.2]
  def change
    change_column :candidatures, :status, :string, default: "Pending"
  end
end