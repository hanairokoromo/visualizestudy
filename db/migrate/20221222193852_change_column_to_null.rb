class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :notifications, :favorite_id, true
    change_column_null :notifications, :comments, true
    change_column_null :notifications, :post_id, true
  end
end
