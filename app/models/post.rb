class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    
    def favorited_by?(user)
        favorites.exists?(user_id: user_id)
    end
end
