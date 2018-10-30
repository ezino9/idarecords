class Video < ApplicationRecord
    belongs_to :user
    belongs_to :type

    validates_presence_of :song_title
    validates_presence_of :singer_name
    validates_presence_of :youtube_link
    validates_presence_of :song_title

    has_attached_file :coverpicture, styles: { medium: "300x300>", thumb: "100x100#" } #default_url: "/images/:style/missing.png"
    validates_attachment_content_type :coverpicture, content_type: /\Aimage\/.*\Z/
    def self.search(query)
        where("song_title like ? OR singer_name like ?","%#{query}%", "%#{query}%")
    end
end
