class CreateElections < ActiveRecord::Migration[5.2]
  def change
    create_table :elections do |t|
      t.string :name
      t.string :status
      t.string :description
      t.date :voting_start_date
      t.date :voting_end_date
      t.date :campaign_close_date
      t.integer :results

      t.timestamps
    end
  end
end
