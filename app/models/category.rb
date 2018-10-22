class Category < ApplicationRecord
    has_many :posts
    has_many :audios
    has_many :videos

    validates_uniqueness_of :post
    validates_uniqueness_of :song
    
    validates_presence_of :song
    validates_presence_of :post
end
