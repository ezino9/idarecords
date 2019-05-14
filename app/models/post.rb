class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :comments
    
    has_attached_file :coverpicture, styles: { medium: "300x300>", thumb: "100x100#" } #default_url: "/images/:style/missing.png"
    validates_attachment_content_type :coverpicture, content_type: /\Aimage/

    validates_presence_of :coverpicture
    validates_presence_of :title
    validates_presence_of :body

    def self.search(query)
        where("body like ? OR title like ?","%#{query}%", "%#{query}%")
    end
end
