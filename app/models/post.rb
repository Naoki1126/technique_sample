class Post < ApplicationRecord
    validates :title, presence: true
    validates :caption, presence: true

    attachment :image
end

