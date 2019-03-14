class AddingPromisesToCandidature < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :promise1, :string
    add_column :candidatures, :promise2, :string
    add_column :candidatures, :promise3, :string
  end
end
