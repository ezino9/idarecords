class Video < ApplicationRecord
    belongs_to :user
    belongs_to :category

    validates_presence_of :song_title
    validates_presence_of :singer_name
    validates_presence_of :youtube_link
    validates_presence_of :song_title


    def self.search(query)
        where("song_title like ? OR singer_name like ?","%#{query}%", "%#{query}%")
    end
end
