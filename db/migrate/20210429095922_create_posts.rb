class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :hashtag_id
      t.string :title
      t.string :caption
      t.timestamps
    end
  end
end
