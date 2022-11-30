class AddStartTimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :start_time, :datetime, null: false
    add_column :posts, :finish_time, :datetime, null: false
  end
end
