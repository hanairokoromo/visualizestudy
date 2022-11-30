class Notification < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :post, dependent: :destroy
    belongs_to :favorite, dependent: :destroy
    belongs_to :comment, dependent: :destroy
end
