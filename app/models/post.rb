class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category
    
    def favorited_by?(user)
        favorites.exsist?(user_id: user_id)
    end
end
