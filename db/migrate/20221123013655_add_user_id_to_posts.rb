class AddUserIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :user_id, :integer, null: false
    add_column :posts, :category_id, :integer, null: false
  end
end
