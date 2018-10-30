class AddAttachmentCoverpictureToVideos < ActiveRecord::Migration[5.2]
  def self.up
    change_table :videos do |t|
      t.attachment :coverpicture
    end
  end

  def self.down
    remove_attachment :videos, :coverpicture
  end
end
