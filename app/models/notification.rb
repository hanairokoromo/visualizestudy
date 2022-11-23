class Notification < ApplicationRecord
    belongs_to :users
    belongs_to :posts
    belongs_to :favorites
    belongs_to :comments
end
