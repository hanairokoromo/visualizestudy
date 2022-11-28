class Post < ApplicationRecord
    belongs_to :users
    belongs_to :categories
    
    def favorited_by?(user)
        favorites.exsist?(user_id: user_id)
    end
end
