class CreateEligibleVoters < ActiveRecord::Migration[5.2]
  def change
    create_table :eligible_voters do |t|

      t.timestamps
    end
  end
end
