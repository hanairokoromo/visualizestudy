class Post < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :category, dependent: :destroy
    
    def favorited_by?(user)
        favorites.exsist?(user_id: user_id)
    end
end
