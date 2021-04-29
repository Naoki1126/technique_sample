class RemoveHashtagIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :hashtag_id, :integer
  end
end
