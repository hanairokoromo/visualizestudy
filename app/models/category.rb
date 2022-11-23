class Category < ApplicationRecord
    belongs_to :users
    has_many :posts, dependent: :destroy
end
