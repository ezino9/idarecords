class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :song_title
      t.string :singer_name
      t.string :rabel_name
      t.integer :user_id
      t.string :youtube_link

      t.timestamps
    end
  end
end
