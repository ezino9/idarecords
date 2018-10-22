class AddAttachmentSongAudioToAudios < ActiveRecord::Migration[5.2]
  def self.up
    change_table :audios do |t|
      t.attachment :song_audio
    end
  end

  def self.down
    remove_attachment :audios, :song_audio
  end
end
