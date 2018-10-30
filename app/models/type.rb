class Type < ApplicationRecord
    has_many :audios
    has_many :videos
    validates :name, presence: true, uniqueness: true
    
    
end
