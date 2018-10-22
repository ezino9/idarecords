class AddAttachmentCoverpictureToPosts < ActiveRecord::Migration[5.2]
  def self.up
    change_table :posts do |t|
      t.attachment :coverpicture
    end
  end

  def self.down
    remove_attachment :posts, :coverpicture
  end
end
