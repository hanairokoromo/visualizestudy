class Comment < ApplicationRecord
    belongs_to :post
    belongs_to :user
    has_many :notifications, dependent: :destroy, foreign_key: 'comment_id'
end
