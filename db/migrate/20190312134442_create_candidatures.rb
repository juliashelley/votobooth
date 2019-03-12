class CreateCandidatures < ActiveRecord::Migration[5.2]
  def change
    create_table :candidatures do |t|
      t.string :picture
      t.string :name
      t.string :video_url
      t.string :status
      t.integer :total_votes

      t.timestamps
    end
  end
end
