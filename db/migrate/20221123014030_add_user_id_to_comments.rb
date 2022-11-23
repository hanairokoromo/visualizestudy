class AddUserIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :user_id, :integer, null: false
    add_column :comments, :post_id, :integer, null: false
  end
end
