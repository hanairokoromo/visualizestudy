class Favorite < ApplicationRecord
    belongs_to :posts
    belongs_to :users
end
