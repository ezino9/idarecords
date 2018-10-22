class Audio < ApplicationRecord
  belongs_to :user
  belongs_to :category
  #validates picture to uplaod
  has_attached_file :coverpicture, styles: { medium: "300x300>", thumb: "100x100#" } #default_url: "/images/:style/missing.png"
  validates_attachment_content_type :coverpicture, content_type: /\Aimage\/.*\Z/

  #valides audios to upload
  has_attached_file :song_audio 
  validates_attachment :song_audio,
  :content_type => {:content_type => ["audio/mpeg", "audio/mp3"]},
  :file_type => {:matches => [/mp3\Z/]}

  validates_presence_of :title
  validates_presence_of :artist


  def self.search(query)
    where("artist like ? OR title like ?","%#{query}%", "%#{query}%")
end
end
