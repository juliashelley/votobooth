class AddingTaglineToCandidature < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :tagline, :text
  end
end
