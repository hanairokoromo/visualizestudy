class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.time :study_time, null: false
      t.text :check
      t.timestamps
    end
  end
end
