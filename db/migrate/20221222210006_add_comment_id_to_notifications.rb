class AddCommentIdToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_column :notifications, :comment_id, :integer, null: true
  end
end
