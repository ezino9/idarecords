class AddAttachmentCoverpictureToAudios < ActiveRecord::Migration[5.2]
  def self.up
    change_table :audios do |t|
      t.attachment :coverpicture
    end
  end

  def self.down
    remove_attachment :audios, :coverpicture
  end
end
