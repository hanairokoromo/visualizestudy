class RemoveStudyTimeFromPosts < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :study_time, :integer
  end
end
