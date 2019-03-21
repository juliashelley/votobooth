class AddingYoutubeUrl < ActiveRecord::Migration[5.2]
  def change
    add_column :candidatures, :youtube_url, :string
  end
end
